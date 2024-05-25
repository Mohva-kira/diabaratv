import { useDispatch, useSelector } from "react-redux";

import { Error, Loader, SongCard, VideoPlayer } from "../components";
import { genres } from "../assets/constants";
import { useGetSongsQuery } from "../redux/services/songsApi";
import { selectGenreListId } from "../redux/features/playerSlice";
import playerImg from "../assets/player.png";
import { useEffect, useState } from "react";
import { setSongs } from "../redux/features/songsSlice";
import { useParams } from "react-router-dom";
import { setStreams, useGetStreamsQuery } from "../redux/services/streams";
import { Scrollable } from "../components";
import { v4 as uuidv4 } from "uuid";
import { db } from "../db/db";
import { useLiveQuery } from "dexie-react-hooks";
import {
  importDB,
  exportDB,
  importInto,
  peakImportFile,
} from "dexie-export-import";

// import './index.css'
// import Data from '../../data'

const Discover = () => {
  const dispatch = useDispatch();
  const indexedSongs = useLiveQuery(() => db.songs.toArray());
  const indexedStreams = useLiveQuery(() => db.streams.toArray());
  const indexedImages = useLiveQuery(() => db.images.toArray());

  const [songFiles, setSongFiles] = useState();
  const { activeSong, isPlaying, genreListId } = useSelector(
    (state) => state.player
  );
  const { data, isSuccess, isFetching, isLoading, error } = useGetSongsQuery();
  const [base64IMG, setBase64IMG] = useState();
  const [streams, setStreams] = useState();
  const {
    data: streamsData,
    isSuccess: isStreamSuccess,
    isFetching: isStreamFetching,
    isError: isStreamError,
    currentData: streamCurrent,
    refetch,
  } = useGetStreamsQuery("");

  const stateStreamed = useSelector((state) => state.streams);

  const userAgent = window.navigator.userAgent;
  const platform = window.navigator.platform;
  const randomString =
    Math.random().toString(20).substring(2, 14) +
    Math.random().toString(20).substring(2, 14);

  const deviceID = !localStorage.getItem("uuid")
    ? `${userAgent}-${platform}-${randomString}`
    : localStorage.getItem("uuid");
  console.log("device Id", deviceID);
  localStorage.setItem("uuid", deviceID);

  console.log("uuid", localStorage.getItem("uuid"));

  const convertToBase64 = async (file) => {
    const base64 = await fetch("https://api.diabara.tv/api" + file)
      .then((response) => response.blob())
      .then((blob) => {
        const reader = new FileReader();
        reader.readAsDataURL(blob);
        return new Promise((res) => {
          reader.onloadend = () => {
            res(reader.result);
          };
        });
      });
    console.log("base 64", base64);
    return base64;
  };

  // AJouter les sons à la base de données indexée
  async function addSongs({
    id,
    name,
    audio,
    artist,
    date_de_sortie,
    cover,
    genre,
    pays,
    ville,
    album,
  }) {
    var id;
    try {
      if (name && audio) {
        id = await db.songs.add({
          name,
          audio,
          cover,
          date_de_sortie,
          artist,
          album,
          pays,
          ville,
        });
      } else {
        alert(" provide name and age field of student ");
      }
      setStatus(`Student ${name} successfully added. Got id ${id}`);
      setName("");
      setAge(defaultAge);
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }

  // AJouter les streams à la base de données indexée
  async function addStreams({ user, song, start, end, uuid }) {
    var id;
    try {
      if (user && song) {
        id = await db.streams.add({
          user,
          song,
          start,
          end,
          uuid,
        });
      } else {
        alert(" provide user and song field of student ");
      }
      setStatus(`Student ${name} successfully added. Got id ${id}`);
      setName("");
      setAge(defaultAge);
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }

  //Supprimé la base de données indexée
  const clearAll = () => {
    db.delete()
      .then(() => {
        alert(" database deleted ");
      })
      .catch((err) => {
        console.error("Could not delete database", err);
        alert("Could not delete database");
      })
      .finally(() => {
        // Do what should be done next...
      });
  };

  //Convertir les fichiers audios pour la base de données indexées

  //Audio to Base64

  var bufferToBase64 = async function (buffer) {
    const file = await fetch(buffer)
    .then((response) => response.blob())
    
    var bytes = new Uint8Array(file);
    var len = file.byteLength;
    var binary = "";
    for (var i = 0; i < len; i++) {
      binary += String.fromCharCode(bytes[i]);
    }
    return window.btoa(binary);
  };
  //Base64ToAudio
  var base64ToBuffer = function (buffer) {
    var binary = window.atob(buffer);
    var buffer = new ArrayBuffer(binary.length);
    var bytes = new Uint8Array(buffer);
    for (var i = 0; i < buffer.byteLength; i++) {
      bytes[i] = binary.charCodeAt(i) & 0xff;
    }
    return buffer;
  };

  const genreTitle = "Pop";
  const artistId = useParams();
  const indexedSongReverse = indexedSongs && indexedSongs;
  const online = window.navigator.online;

  const realData = window.navigator.onLine
    ? data && [...data?.data].reverse()
    : indexedSongReverse?.map((item, index) => ({
        id: index,
        attributes: item,
      }));

  useEffect(() => {
    setStreams(streamCurrent ? streamCurrent : streamsData);
  }, [streamCurrent]);

  useEffect(() => {
    //Adding song to Indexed Database
    // clearAll()
    let result = {};
    if (data?.data.length > 0) {
      if (!indexedSongs || indexedSongs.length === 0) {
        data?.data.map(async (item) => {
          let [data64, song64] = await Promise.all([
            convertToBase64(item.attributes.cover?.data[0].attributes.url),
            bufferToBase64(`https://api.diabara.tv/api${item.attributes.audio.data.attributes.url}`)
          ]);

          console.log("data 64 2", data64);
          console.log("data Song", song64);
          result.name = item.attributes.name;
          result.audio = online ? item.attributes.audio : song64;
          result.cover = online
            ? item.attributes.cover.data[0].attributes.url
            : data64
            ? data64
            : item.attributes.cover.data[0].attributes.url;
          (result.date_de_sortie = item.attributes?.date_de_sortie),
            (result.artist = item.attributes.artist),
            (result.album = item.attributes.album),
            (result.pays = item.attributes.pays),
            (result.ville = item.attributes.ville),
            addSongs(result);
        });
      }
    }

    if (streamsData?.data.length > 0) {
      if (!indexedStreams || indexedStreams.length === 0) {
        streamsData?.data.map((item) => {
          if (item.attributes.user) addStreams(item.attributes);
        });
      }
    }
  }, [data]);

  if (isFetching) return <Loader title="loading songs...." />;

  // if (error) return <Error />;

  isSuccess &&
    localStorage.setItem("songs", JSON.stringify(data)) &&
    dispatch(setSongs(data?.data));

  return (
    <div className="flex flex-col">
      {console.log("streamCurrent", stateStreamed)}
      {console.log("Indexed Songs", indexedSongs)}
      {console.log("files Songs", indexedImages)}
      <div className="w-full flex justify-between items-center sm:flex-row flex-col mt-4 mb-10">
        <h2 className="font-bold text-3xl text-white text-left">
          {" "}
          Discover {genreTitle}{" "}
        </h2>
        <select
          name=""
          id=""
          onChange={(e) => {
            dispatch(selectGenreListId(e.target.value));
          }}
          value={genreListId || "pop"}
          className="bg-black text-gray-300 p-3 text-sm rounded-lg outline-none sm:mt-0 mt-5"
        >
          {genres.map((genre) => (
            <option key={genre.value} value={genre.value}>
              {" "}
              {genre.title}{" "}
            </option>
          ))}
        </select>
      </div>

      <div className="flex flex-col  mb-10 inset-0 rounded-xl justify-center items-center bg-gradient-to-l md:w-[710px]  md:h-96">
        <div className="justify-center  items-center flex md:w-[90%] md:h-[90%] sm:w-[90%] sm:h-[90%] rounded-xl">
          <VideoPlayer />
        </div>
      </div>
      {isLoading || isFetching || !realData ? (
        <Loader />
      ) : (
        <Scrollable data={realData}>
          <div className="flex flex-wrap sm:justify-start justify-center gap-8">
            {realData?.map((song, i) => (
              <SongCard
                key={song.id}
                song={song}
                i={i}
                isPlaying={isPlaying}
                activeSong={activeSong}
                data={realData}
                streams={streams?.data.filter(
                  (item) => item.attributes.song.data.id === song.id
                )}
                streamsRefetch={refetch}
              />
            ))}
          </div>
        </Scrollable>
      )}
    </div>
  );
};

export default Discover;
