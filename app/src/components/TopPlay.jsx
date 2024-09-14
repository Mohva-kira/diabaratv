import { useEffect, useRef, useState } from "react";
import { Link } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { Swiper, SwiperSlide } from 'swiper/react'
import { FreeMode } from 'swiper'

import PlayPause from "./PlayPause";
import { playPause, setActiveSong } from "../redux/features/playerSlice";
import { useGetSongsQuery } from "../redux/services/songsApi";

import 'swiper/css'
import 'swiper/css/free-mode'
import { useGetArtistsQuery } from "../redux/services/artistApi";
import { liveQuery } from "dexie";
import { useLiveQuery } from "dexie-react-hooks";
import { db } from "../db/db";
const { onLine } = window.navigator

export const TopChartCard = ({ song, i, isPlaying, activeSong, handlePauseClick, handlePlayClick }) => (
  <div className="w-full flex flex-row items-center hover:bg-[#4c426e] py-2 p-4 rounded-lg cursor-pointer mb-2">
    <h3 className="fot-bold text-base text-white mr-3">
      {i + 1}.
    </h3>
    <div className="flex-1 flex flex-row justify-between items-center">
      <img src={onLine ? `https://api.diabara.tv${song?.attributes?.cover?.data[0]?.attributes?.url} ` : `${song.attributes.cover}`} alt="" className="w-20 h-20 rounded-lg" />

      <div className="flex-1 flex-col justify-center mx-3">
        <Link to={`/songs/${song.id}`}>
          <p className="text-xl font-bold text-white">{song?.attributes.name}</p>
        </Link>
        <Link to={`/artists/${song.attributes.artist.data.id}`}>
          <p className="text-base  text-gray-300 mt-1">{song?.attributes.artist.data.attributes.name}</p>
        </Link>

      </div>
    </div>
    <PlayPause
      isPlaying={isPlaying}
      activeSong={activeSong}
      song={song}
      handlePause={handlePauseClick}
      handlePlay={handlePlayClick}
    />
  </div>
)



const TopPlay = () => {
  const dispatch = useDispatch()
  const { activeSong, isPlaying } = useSelector((state) => state.player)
  const { data: songData } = useGetSongsQuery()
  const { data: artistData } = useGetArtistsQuery()
  const indexedSongs = useLiveQuery(() => db.songs.toArray());
  const indexedArtist = useLiveQuery(() => db.artists.toArray());
  const [status, setStatus] = useState()

  const divRef = useRef(null)

  async function addArtists({ name, image, date_naissance, adresse, pays, ville, email, biographie, genres }) {
    var id;
    try {
      if (name && image) {
        id = await db.streams.add({
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
        alert(" provide name and image field of artists ");
      }
      setStatus(`Student ${name} successfully added. Got id ${id}`);
      setName("");
      setAge(defaultAge);
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }

  async function addSongs({ id, name, audio, artist, date_de_sortie, cover, genre, pays, ville, album }) {
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
          ville
        });
      } else {
        alert(" provide name and audio field of song ");
      }
      setStatus(`Student ${name} successfully added. Got id ${id}`);
      setName("");
      setAge(defaultAge);
    } catch (error) {
      setStatus(`Failed to add ${name}: ${error}`);
    }
  }
  useEffect(() => {
    if (artistData?.data.length > 0) {

      if (!indexedArtist || indexedArtist.length === 0) {
        artistData?.data.map(item => {
          addArtists(item.attributes)
        })
      }

    }



  }, [artistData, songData])


  useEffect(() => {
    divRef.current.scrollIntoView({ behavior: 'smooth' })
  })



  const onLine = window.navigator.onLine
  const toSort = onLine ? songData && [...songData?.data] : indexedSongs && indexedSongs.map((item, index) => ({ id: index, attributes: item }))
  const topPlays = toSort?.sort((a, b) => a.itemM > b.itemM ? 1 : -1).slice(0, 5)
  const data = songData?.data

  const toSortArtist = artistData && [...artistData?.data]
  const TopArtists = toSortArtist?.sort((a, b) => a.itemM > b.itemM ? 1 : -1).slice(0, 5)

  const handlePauseClick = () => {
    dispatch(playPause(false))

  }
  const handlePlayClick = (song, i) => {
    console.log(activeSong)
    dispatch(setActiveSong({ song, data, i }))
    dispatch(playPause(true))
  }

  return (
    <div ref={divRef} className="xl:ml-6 ml-0 xl:mb-0 mb-6 flex-1 xl:max-w-[400px] max-w-full flex flex-col">
      <div className="w-full flex flex-col">
        <div className="flex flex-row justify-between items-center ">
          
          <h2 className="text-white font-bold text-2xl">Top Classements</h2>
          <Link to="/top-charts" >
            <p className="text-gray-300 text-base cursor-pointer">Voir plus</p>
          </Link>

        </div>
        <div className="mt-4 flex flex-col gap-1">
          {topPlays?.map((song, i) => (

            <TopChartCard
              key={song.id}
              song={song}
              i={i}
              isPlaying={isPlaying}
              activeSong={activeSong}
              handlePauseClick={handlePauseClick}
              handlePlayClick={() => handlePlayClick(song, i)}
            />


          ))}

        </div>

      </div>

      <div className="w-full flex flex-col mt-8">

        <div className="flex flex-row justify-between items-center ">

          <h2 className="text-white font-bold text-2xl">Top Artists</h2>
          <Link to="/top-artists" >
            <p className="text-gray-300 text-base cursor-pointer">Voir plus</p>
          </Link>

        </div>

        <Swiper
          slidesPerView="auto"
          spaceBetween={15}
          freeMode
          centeredSlides
          centeredSlidesBounds
          modules={[FreeMode]}
          className="mt-4"
        >
          {TopArtists?.map((song, i) => (
            <SwiperSlide
              key={song.id}
              style={{ width: '25%', height: "25%" }}
              className="shadow-lg rounded-full animate-slideright"
            >
              <Link to={`/artists/${song?.id}`}>
                <img src={`https://api.diabara.tv${song?.attributes?.image?.data[0]?.attributes?.url}`} alt="" className="rounded-full w-full object-cover" />

              </Link>

            </SwiperSlide>
          ))}
        </Swiper>
      </div>



    </div>
  )

}


export default TopPlay;
