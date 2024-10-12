import React from "react";
import { SongCard } from "../components";
import { useGetLikesQuery } from "../redux/services/like";
import { useSelector } from "react-redux";
import { useGetStreamsQuery } from "../redux/services/streams";
import Streams from "./../components/Streams";
import { useGetSongsQuery } from "../redux/services/songsApi";

const Favourites = () => {
  const { data: likes, isLoading, isFetching, refetch } = useGetLikesQuery();
  const {
    data: streamsData,
    isSuccess: isStreamSuccess,
    isFetching: isStreamFetching,
    isError: isStreamError,
    refetch: refetchStreams,
  } = useGetStreamsQuery("");
  const {
    data,
    isSuccess,
    isFetching: isFetchingSongs,
    error,
  } = useGetSongsQuery();

  const { activeSong, isPlaying, genreListId } = useSelector(
    (state) => state.player
  );

  //   const isLiked = likes?.data.find(
  //     (like) =>
  //       like?.attributes?.user?.data?.id === 1 &&
  //       like?.attributes?.song?.data.id === song
  //   );

  const songsData =
    likes &&
    data &&
    data?.data.filter((item, index) =>
      likes?.data.find((song) => song.attributes.song.data.id === item.id)
    );

  return (
    <div>
      
      <div className="w-[1/2] m-2 p-2 h[1/2] flex flex-wrap gap-10 sm:flex-col rounded-2xl  text-white shadow-xl bg-gradient-to-b bg-gradient-to-tr bg-blue-700 mb-16">
        <div className="flex flex-col items-center flex-wrap gap-4 justify-around w-full md:flex-row lg:flex-row  sm:flex-wrap sm:gap-14 sm:flex-col ">
          <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">Mandingue</span>
          <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">Pop</span>
          <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">Rap</span>
          <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">RnB</span>
          <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">Rap Mandingue</span>

        </div>

        <div className="flex flex-col space-y-4 items-center justify-center w-full ">
          {/* <div className="flex flex-wrap gap-4">
            <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">
              Lundi
            </span>
            <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">
              Mardi
            </span>
            <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">
              Mercredi
            </span>
            <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">
              Jeudi
            </span>
            <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">
              Vendredi
            </span>
            <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">
              Samedi
            </span>
            <span className="bg-slate-600 cursor-pointer hover:text-orange-600 hover:font-bold font-semibold bg-transparent rounded-2xl p-3 flex items-center justify-center h-8">
              Dimanche
            </span>
          </div> */}


        </div>
      </div>

      <div className="flex flex-wrap sm:justify-start justify-center gap-8">
        {songsData?.map((song, i) => (
          <SongCard
            key={song?.id}
            song={song}
            i={i}
            isPlaying={isPlaying}
            activeSong={activeSong}
            data={likes?.data && likes.data}
            streams={streamsData?.data.filter(
              (item) => item.attributes.song.data.id === song?.id
            )}
            streamsRefetch={refetch}
          />
        ))}
      </div>
    </div>
  );
};

export default Favourites;
