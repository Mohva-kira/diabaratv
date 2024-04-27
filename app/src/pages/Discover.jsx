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


// import './index.css'
// import Data from '../../data'

const Discover = () => {
  const dispatch = useDispatch();
  const { activeSong, isPlaying, genreListId } = useSelector(
    (state) => state.player
  );
  const { data, isSuccess, isFetching, error } = useGetSongsQuery();
  const [streams, setStreams] = useState()
  const {
    data: streamsData,
    isSuccess: isStreamSuccess,
    isFetching: isStreamFetching,
    isError: isStreamError,
    currentData: streamCurrent,
    refetch,
  } = useGetStreamsQuery("");

 const stateStreamed = useSelector(state => state.streams)

  const userAgent = window.navigator.userAgent;
  const platform = window.navigator.platform;
  const randomString =
    Math.random().toString(20).substring(2, 14) +
    Math.random().toString(20).substring(2, 14);

  const deviceID = !localStorage.getItem('uuid') ? `${userAgent}-${platform}-${randomString}` : localStorage.getItem('uuid');
  console.log('device Id', deviceID);
   localStorage.setItem("uuid", deviceID);

  console.log("uuid", localStorage.getItem("uuid"));

  const genreTitle = "Pop";
  const artistId = useParams();

  const realData = data && [...data?.data].reverse();

  useEffect(() => {
    setStreams(streamCurrent ? streamCurrent : streamsData)
  },[streamCurrent])

  
  

  if (isFetching) return <Loader title="loading songs...." />;

  if (error) return <Error />;

  isSuccess &&
    localStorage.setItem("songs", JSON.stringify(data)) &&
    dispatch(setSongs(data?.data));

 


  return (
    <div className="flex flex-col">
      {console.log('streamCurrent', stateStreamed)}
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

      <Scrollable data={realData}>
        <div className="flex flex-wrap sm:justify-start justify-center gap-8">
          {realData?.map((song, i) => (
            <SongCard
              key={song.id}
              song={song}
              i={i}
              isPlaying={isPlaying}
              activeSong={activeSong}
              data={
                data?.data
                  ? data.data
                  : JSON.parse(localStorage.getItem("songs"))?.data
              }
              streams={streams?.data.filter(
                (item) => item.attributes.song.data.id === song.id
              )}
              streamsRefetch={refetch}
            />
          ))}
        </div>
      </Scrollable>
    </div>
  );
};

export default Discover;
