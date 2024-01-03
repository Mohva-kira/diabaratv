import { Link } from "react-router-dom";
import { useDispatch } from "react-redux";

import PlayPause from "./PlayPause";
import { playPause, setActiveSong } from "../redux/features/playerSlice";

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

  return (
    <div
      className="flex flex-col w-[250px] p-4 bg-white/5 bg-opacity-80 
          backdrop-blur-sm animate-slideup rounded-lg cursor-pointer"
    >
      <div className="relative w-full h-56 group ">
        <div
          className={`absolute inset-0 justify-center items-center bg-black bg-opacity-30 rounded-full group-hover:flex ${
            activeSong?.id === song.id
              ? "flex bg-black bg-opacity-70"
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
          src={`http://localhost:1337${song.attributes.cover.data[0].attributes.url}`}
          className="rounded-2xl"
          alt="song-img"
        />
      </div>
      <div className="mt-4 flex flex-col ">
        <p className="font-semibolg text-lg text-white truncate">
          <Link to={`/songs/${song?.id}`}>{song.attributes.name}</Link>
        </p>

        <p className="text-sm truncate text-gray-300 mt-1">
          <Link
            to={
              song?.attributes?.artist.data.attributes?.name
                ? `/artists/${song?.attributes?.artist.data.id}`
                : "/top-artists"
            }
          >
            {song?.attributes?.artist?.data?.attributes.name}
          </Link>
        </p>
        <p className="text-sm truncate text-gray-300 mt-1">
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
      </div>
    </div>
  );
};

export default SongCard;
