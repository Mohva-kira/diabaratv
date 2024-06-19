import { useDispatch, useSelector } from 'react-redux';

import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

import { useLiveQuery } from 'dexie-react-hooks';


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

import { setSongs } from '../redux/features/songsSlice';
import { setStreams, useGetStreamsQuery } from '../redux/services/streams';
import { db } from '../db/db';
import { useGetArtistsQuery } from '../redux/services/artistApi';
import ReactGA from 'react-ga4';

// import './index.css'
// import Data from '../../data'

const Discover = () => {

  ReactGA.send({
    hitType: "pageview",
    page: "/",
    title: "Discovery - Decouvertes"
  })


  const dispatch = useDispatch();
  const indexedSongs = useLiveQuery(() => db.songs.toArray());
  const indexedStreams = useLiveQuery(() => db.streamsData.toArray());
  const indexedImages = useLiveQuery(() => db.images.toArray());
  const indexedArtists = useLiveQuery(() => db.artists.toArray());


  const [url, setUrl] = useState('');
  const [status, setStatus] = useState('');


  const { activeSong, isPlaying, genreListId } = useSelector(
    (state) => state.player,
  );
  const { data, isSuccess, isFetching, isLoading, error } = useGetSongsQuery();

  const [streams, setStreams] = useState();
  const {
    data: streamsData,
    isSuccess: isStreamSuccess,
    isFetching: isStreamFetching,
    isError: isStreamError,
    currentData: streamCurrent,
    refetch,
  } = useGetStreamsQuery('');

  const { data: artistsData, isFetching: artistsIsFetching, isSuccess: artistIsSuccess } = useGetArtistsQuery('')



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
                streams={onLine ? streams?.data.filter(
                  (item) => item.attributes.song.data.id === song.id,
                ) : indexedStreams.filter(
                  (item) => item.song && item.song.data.id === song.id,
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
