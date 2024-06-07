import { useDispatch, useSelector } from 'react-redux';

import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios'
import Buffer from "buffer"
import { v4 as uuidv4 } from 'uuid';
import { useLiveQuery } from 'dexie-react-hooks';

import {
  importDB,
  exportDB,
  importInto,
  peakImportFile,
} from 'dexie-export-import';
import {
  Error,
  Loader,
  SongCard,
  VideoPlayer,
  Scrollable,
} from '../components';
import { genres } from '../assets/constants';
import { useGetSongsQuery } from '../redux/services/songsApi';
import { selectGenreListId } from '../redux/features/playerSlice';
import playerImg from '../assets/player.png';
import { setSongs } from '../redux/features/songsSlice';
import { setStreams, useGetStreamsQuery } from '../redux/services/streams';
import { db } from '../db/db';
import { useGetArtistsQuery } from '../redux/services/artistApi';

// import './index.css'
// import Data from '../../data'

const Discover = () => {
  const dispatch = useDispatch();
  const indexedSongs = useLiveQuery(() => db.songs.toArray());
  const indexedStreams = useLiveQuery(() => db.streamsData.toArray());
  const indexedImages = useLiveQuery(() => db.images.toArray());
  const indexedArtists = useLiveQuery(() => db.artists.toArray());

  
  const [url, setUrl] = useState('');
  const [status, setStatus] = useState('');

  const [songFiles, setSongFiles] = useState();
  const { activeSong, isPlaying, genreListId } = useSelector(
    (state) => state.player,
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
  } = useGetStreamsQuery('');

  const {data: artistsData, isFetching: artistsIsFetching, isSuccess: artistIsSuccess} = useGetArtistsQuery('')

  const stateStreamed = useSelector((state) => state.streams);

  const { userAgent } = window.navigator;
  const { platform } = window.navigator;
  const randomString = Math.random().toString(20).substring(2, 14)
    + Math.random().toString(20).substring(2, 14);

  const deviceID = !localStorage.getItem('uuid')
    ? `${userAgent}-${platform}-${randomString}`
    : localStorage.getItem('uuid');
  // console.log('device Id', deviceID);
  localStorage.setItem('uuid', deviceID);

  // console.log('uuid', localStorage.getItem('uuid'));

  const convertToBase64 = async (file) => {
    const base64 = await fetch(`https://api.diabara.tv${file}`)
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
    // console.log('base 64', base64);
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
        alert(' provide name and age field of student ');
      }
      setStatus(`Student ${name} successfully added. Got id ${id}`);
      setName('');
      setAge(defaultAge);
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }

  // AJouter les streams à la base de données indexée
  async function addStreams({ song, start, end, uuid }) {
    let id;
    try {
      if (uuid && song) {
        id = await db.streamsData.add({
          song,
          start,
          end,
          uuid,
        });
      } else {
        alert(' provide user and song field of student ');
      }
      setStatus(`Streams successfully added. Got id ${id}`);
      
      
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }

  // Ajouter les artistes à la base de donnée indexée
    async function addArtists({ name, image, date_naissance, adresse, pays, ville, email, biographie, genres }) {
    let id;
    try {
      if (name && image) {
        id = await db.artists.add({
          name,
          image,
          date_naissance,
          adresse,
          pays,
          ville,
          email,
          biographie,
          genres
        });
      } else {
        alert(' provide name and image field of artist ');
      }
      setStatus(`Artist successfully added. Got id ${id}`);
      
      
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }
  // Supprimé la base de données indexée
  const clearAll = () => {
    
    db.delete({disableAutoOpen: false})
      .then(() => {
        alert(' database deleted ');
      })
      .catch((err) => {
        console.error('Could not delete database', err);
        alert('Could not delete database');
      })
      .finally(() => {
        // Do what should be done next...
      });
  };

  // clearAll()

  // Convertir les fichiers audios pour la base de données indexées

  // Audio to Base64

  const downloadAndStoreAudio = async (audioUrl) => {
    try {
      setStatus('Downloading...');
      const response = await axios.get(`https://api.diabara.tv${audioUrl}`, {
        responseType: 'arraybuffer',
      });
      const base64String = Buffer.Buffer.from(response.data, 'binary').toString(
        'base64',
      );
      const base64Audio = `data:audio/mp3;base64,${base64String}`;

      // console.warn('song base 64', base64Audio)
      setStatus('Audio stored successfully!');

      return base64Audio

    } catch (error) {
      console.error('Error downloading or storing audio:', error);
      setStatus('Failed to store audio.');
    }
  };

  const genreTitle = 'Pop';
  const artistId = useParams();
  const indexedSongReverse = indexedSongs && indexedSongs;
  const { onLine } = window.navigator;

  const realData = window.navigator.onLine
    ? data && [...data?.data].reverse()
    : indexedSongReverse?.map((item, index) => ({
      id: index,
      attributes: item,
    }));

  // Traitement des données de sons
 useEffect(() => {
    // Adding song to Indexed Database
    // clearAll()
    const result = {};
    if (data?.data.length > 0) {
     
        data?.data.map(async (item) => {
           if (indexedSongs?.length === 0) {
          const data64 = await convertToBase64(
            item.attributes.cover?.data[0].attributes.url,
          );
          const song64 = await downloadAndStoreAudio(
            item.attributes.audio?.data.attributes.url,
          );
          // console.log('data 64 2', data64);
          // console.log('data Song', song64);
          result.name = item.attributes.name;
          result.audio =  song64;
          result.cover = data64;
          (result.date_de_sortie = item.attributes?.date_de_sortie),
          (result.artist = item.attributes.artist),
          (result.album = item.attributes.album),
          (result.pays = item.attributes.pays),
          (result.ville = item.attributes.ville),
          addSongs(result);
          }
        });
      
    }

    
  }, [data]);

  // Traitement des données artistes
 useEffect(() => {
    
    let result = {}
  
      if (artistsData?.data?.length > 0) {
    
        artistsData?.data.map(async (item) => {
            if (indexedArtists?.length === 0) {
              

              if(item.attributes.name){
              
              
              const {name, image, date_naissance, adresse, pays, ville, email, biographie, genres} = item.attributes
              let data64 = await convertToBase64(image.data[0].attributes.url)
              result = {name, image: data64 , date_naissance, adresse, pays, ville, email, biographie, genres}
            addArtists(result);
          }
          
          }
        });
    
    }
  }, [artistsData]);

  // Traitement des données de streamings

  useEffect(() => {
    setStreams(streamCurrent || streamsData);
    let result = {}
      if (streamsData?.data.length > 0) {
    
        streamsData?.data.map((item) => {
            if ( indexedStreams?.length === 0) {
    

              if(item.attributes.uuid){
              console.log('uiid')
              console.log('streamData')
              const {uuid, song, start, end} = item.attributes
              result = {uuid, song, start, end}
            addStreams(result);
          }
          
          }
        });
    
    }
  }, [streamsData]);

 

  if (isFetching) return <Loader title="loading songs...." />;

  // if (error) return <Error />;

  isSuccess
    && localStorage.setItem('songs', JSON.stringify(data))
    && dispatch(setSongs(data?.data));

  return (
    <div className="flex flex-col">
      {console.log('indexed Streams', indexedStreams)}
      {console.log('Indexed Songs', indexedSongs)}
      {console.log('Indexed Artists', indexedArtists)}
      {/* {console.log('files Songs', indexedImages)} */}
      <div className="w-full flex justify-between items-center sm:flex-row flex-col mt-4 mb-10">
        <h2 className="font-bold text-3xl text-white text-left">
          {' '}
          Discover {genreTitle}{' '}
        </h2>
        <select
          name=""
          id=""
          onChange={(e) => {
            dispatch(selectGenreListId(e.target.value));
          }}
          value={genreListId || 'pop'}
          className="bg-black text-gray-300 p-3 text-sm rounded-lg outline-none sm:mt-0 mt-5"
        >
          {genres.map((genre) => (
            <option key={genre.value} value={genre.value}>
              {' '}
              {genre.title}{' '}
            </option>
          ))}
        </select>
      </div>
          {status}
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
                streams={onLine? streams?.data.filter(
                  (item) => item.attributes.song.data.id === song.id,
                ) : indexedStreams.filter(
                  (item) => item.song && item.song.data.id === song.id,
                ) }
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
