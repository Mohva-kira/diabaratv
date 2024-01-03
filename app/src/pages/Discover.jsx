import { useDispatch, useSelector } from "react-redux";

import { Error, Loader, SongCard } from "../components";
import { genres } from "../assets/constants";
import { useGetSongsQuery } from "../redux/services/songsApi";
import { selectGenreListId } from "../redux/features/playerSlice";
import playerImg from "../assets/player.png"
import { useEffect } from "react";
import { setSongs } from "../redux/features/songsSlice";
import { useParams } from "react-router-dom";

// import Data from '../../data'

const Discover = () => {
  const dispatch = useDispatch();
  const { activeSong, isPlaying, genreListId } = useSelector(
    (state) => state.player
  );
  const { data, isSuccess, isFetching, error } = useGetSongsQuery();
  const genreTitle = "Pop";
  const artistId = useParams()


  


  if (isFetching) return <Loader title="loading songs...." />;

  if (error) return <Error />;

  isSuccess &&  localStorage.setItem('songs', JSON.stringify(data)) && dispatch(setSongs(data?.data))
  return (
    <div className="flex flex-col">
        {console.log('la data', data)}
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

      <div className="flex flex-col mb-10 inset-0 rounded-xl justify-center items-center bg-black w-full h-96">
        <div className="justify-center items-center flex w-[90%] h-80 bg-green-300 rounded-xl">
           
              <img src={playerImg} alt="" className="" width={250} height={'auto'}   />

            
        </div>
       </div>
      <div className="flex flex-wrap sm:justify-start justify-center gap-8">
        {data?.data.map((song, i) => (
          <SongCard
            key={song.id}
            song={song}
            i={i}
            isPlaying={isPlaying}
            activeSong={activeSong}
            data={data?.data ? data.data : JSON.parse(localStorage.getItem('songs'))?.data}
          />
        ))}
      </div>
    </div>
  );
};

export default Discover;
