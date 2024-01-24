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
const SongCard = ({ song, i, activeSong, isPlaying, data }) => {
  const dispatch = useDispatch();

  const handlePauseClick = () => {
    dispatch(playPause(false));
  };

  const handlePlayClick = () => {
    console.log("le son actif", song);
    dispatch(setActiveSong({ song, data, i }));
    dispatch(playPause(true));
  };
  const user = localStorage.getItem('auth') ? JSON.parse(localStorage.getItem('auth')) : null
  return (
    <div
      className="flex flex-col w-[241px] p-4 corner bg-white/5  bg-opacity-80 
          backdrop-blur-sm animate-slideup rounded-[2em] cursor-pointer"
    >
      <div className="relative w-full h-56 group ">
        <div
          className={`absolute inset-0 justify-center items-center bg-orange-500  bg-opacity-30 h-[80%] rounded-2xl group-hover:flex ${
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
        <img
          src={`https://api.diabara.tv${song.attributes?.cover?.data[0].attributes.url}`}
          className="rounded-2xl"
          alt="song-img"
        />
      </div>
      <div className="mt-4 flex flex-col ">
        <p className="font-semibolg flex items-center gap-1  text-lg text-white truncate">
        <MdMusicNote className="text-orange-600"/>
          <Link to={`/songs/${song?.id}`}>{song.attributes.name}</Link>
        </p>

        <p className="text-sm flex items-center gap-1 truncate text-gray-300 mt-1">
        <BsFilePerson className="text-orange-600"/>
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
        {song?.attributes?.album?.data && <IoAlbumsOutline className="text-orange-600" /> }
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
          <Like song={song.id} user={user?.user?.id}/>
          <Playlist song={song.id} user={user?.user?.id} />
          <Streams song={song.id} user={user?.user?.id} />
        </div>
      </div>
    </div>
  );
};

export default SongCard;
