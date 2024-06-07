import { Link } from "react-router-dom";
import { useDispatch } from "react-redux";

import PlayPause from "./PlayPause";
import { playPause, setActiveSong } from "../redux/features/playerSlice";

import "./SongCard.css";
import Like from "./Like";
import Streams from "./Streams";
import Playlist from "./Playlist";
import { MdMusicNote } from "react-icons/md";
import { BsFilePerson } from "react-icons/bs";
import { IoAlbumsOutline } from "react-icons/io5";
import { ShareSocial } from "react-share-social";
import { color } from "framer-motion";
import { Helmet } from "react-helmet";
import Loader from "./Loader";
import { useRef, useState } from "react";
import useAnalyticsEventTracker from "./hook/useAnalyticsEventTracker";

const SongCard = ({
  song,
  i,
  activeSong,
  isPlaying,
  data,
  streams,
  refetch,
  detail,
}) => {
  const dispatch = useDispatch();
  const style = {
    root: {
      background: "transparent",
      borderRadius: 3,
      border: 0,
      boxShadow: "0 3px 5px 2px rgba(255, 105, 135, .3)",
      color: "white",

      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      textAlign: "center",
      justifyContent: "center",
      padding: "2px",
      fontSize: "5px",
      minWidth: 190,
      // color: 'red'
    },
    iconContainer: {
      width: "20px",
      height: "10px",
    },
    copyContainer: {
      border: "1px solid blue",
      background: "rgb(0,0,0,0.7)",
      width: "75px",
      height: "25px",
      display: "none",
    },
    title: {
      color: "aquamarine",
      fontStyle: "italic",
    },
    makeStylesContainer1: {
      width: "50px",
    },
  };
  const {onLine} = window.navigator
  const imgRef = useRef();

  //event Tracker

  const gaEventTracker = useAnalyticsEventTracker('Songs');


  const [imgLoading, setImgLoading] = useState(false);
  const handlePauseClick = () => {
    dispatch(playPause(false));
  };

  const handleImageLoad = (e) => {
  
    setImgLoading(e);
    
  };

  const handlePlayClick = () => {
    
    gaEventTracker('play')
    dispatch(setActiveSong({ song, data, i }));
    dispatch(playPause(true));
  };
  const user = localStorage.getItem("auth")
    ? JSON.parse(localStorage.getItem("auth"))
    : null;
  return (
    <div
      className={`flex flex-col ${
        detail ? detail : "w-[241px]"
      }  p-4 corner bg-white/5  bg-opacity-80 backdrop-blur-sm animate-slideup rounded-[2em] cursor-pointer`}
    >
      
      {/* {console.log('cover', song)} */}
      <div className="relative w-full h-56 group ">
        <div
          className={`absolute inset-0 justify-center items-center bg-orange-500  bg-opacity-30  ${
            detail ? "h-full" : "h-[80%]"
          } rounded-2xl group-hover:flex ${
            activeSong?.id === song.id
              ? "flex bg-black w-full bg-opacity-70"
              : "hidden"
          }`}
        >
          <PlayPause
            song={song}
            handlePause={handlePauseClick}
            handlePlay={handlePlayClick}
            isPlaying={isPlaying}
            activeSong={activeSong}
          />
        </div>
        {imgLoading ? (
          <>
          <Loader /> 
          <img
            ref={imgRef}
            src={onLine ? `https://api.diabara.tv${song.attributes?.cover?.data[0]?.attributes?.formats?.small?.url}` : `${song.attributes.cover}`}
            className={`hidden ${
              detail ? "w-full h-full rounded-2xl" : "rounded-2xl"
            } ` }
            alt="song-img"
            // onProgress={(e) => handleImageLoad(true)}
            onLoad={() => handleImageLoad(false)}
          />
          </>
        ) : (
          <img
            ref={imgRef}
            src={onLine ? song.attributes?.cover?.data[0]?.attributes?.formats?.small?.url? `https://api.diabara.tv${song.attributes?.cover?.data[0]?.attributes?.formats?.small?.url}` : `https://api.diabara.tv${song.attributes?.cover?.data[0].attributes?.url}` : song.attributes.cover}
            className={`${
              detail ? "w-full h-full object-contain rounded-2xl" : "rounded-2xl"
            }`}
            alt="song-img"
            // onProgress={(e) => handleImageLoad(true)}
            onLoad={() => handleImageLoad(false)}
          />
        )}
      </div>
      <div className="mt-4 flex flex-col ">
        <p className="font-semibolg flex items-center gap-1  text-lg text-white truncate">
          <MdMusicNote className="text-orange-600" />
          <Link to={`/songs/${song?.id}`}>{song.attributes.name}</Link>
        </p>

        <p className="text-sm flex items-center gap-1 truncate text-gray-300 mt-1">
          <BsFilePerson className="text-orange-600" />
          <Link
            to={
              song?.attributes?.artist?.data.attributes?.name
                ? `/artists/${song?.attributes?.artist.data.id}`
                : "/top-artists"
            }
          >
            {song?.attributes?.artist?.data?.attributes.name}
          </Link>
        </p>
        <p className="text-sm flex items-center gap-1  truncate text-gray-300 mt-1">
          {song?.attributes?.album?.data && (
            <IoAlbumsOutline className="text-orange-600" />
          )}
          <Link
            to={
              song?.attributes?.album
                ? `/artists/${song?.attributes?.album?.data?.id}`
                : "/top-artists"
            }
          >
            {song?.attributes?.album?.data?.attributes.name}
          </Link>
        </p>
        <div className="flex flex-row items-end justify-end gap-4">
          {user && <Like song={song.id} user={user?.user?.id} />}
          {user && <Playlist song={song.id} user={user?.user?.id} />}
          <Streams song={song.id} user={user?.user?.id} streams={streams} />
        </div>
        <ShareSocial
          style={style}
          url={`https://diabara.tv/songs/${song.id}`}
          socialTypes={["facebook", "twitter", "linkedin"]}
        />
      </div>
    </div>
  );
};

export default SongCard;
