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
const {onLine} = window.navigator

const TopChartCard = ({ song, i, isPlaying, activeSong, handlePauseClick, handlePlayClick }) => (
  <div className="w-full flex flex-row items-center hover:bg-[#4c426e] py-2 p-4 rounded-lg cursor-pointer mb-2">
    <h3 className="fot-bold text-base text-white mr-3"> 
      {i+1}.
    </h3>
    <div className="flex-1 flex flex-row justify-between items-center">
      <img src={ onLine ? `https://api.diabara.tv${song?.attributes?.cover?.data[0]?.attributes?.url} `: `${song.attributes.cover}`} alt="" className="w-20 h-20 rounded-lg" />

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
  const {data: artistData } = useGetArtistsQuery()
  const indexedSongs = useLiveQuery(() => db.songs.toArray());
  const indexedArtist = useLiveQuery(() => db.artists.toArray());
  const [status, setStatus] = useState()
  
  const divRef = useRef(null)

  async function addArtists({name, image, date_naissance, adresse, pays, ville, email, biographie, genres}) {
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

  async function addSongs({id, name , audio, artist, date_de_sortie, cover, genre, pays, ville, album}) {
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
    if(artistData?.data.length > 0 ){

      if(!indexedArtist || indexedArtist.length === 0){
        artistData?.data.map(item =>  {
          addArtists(item.attributes)
        })
      }
      
    }
    
  
   
  }, [artistData, songData])
  

  useEffect(() => {
    divRef.current.scrollIntoView({ behavior: 'smooth' })
  })

   
  const isFetching = false
  const error = false

  const musicData = {
    message: "Getting data Successful.",
    data: [
      {
        id: 7,
        0: 7,
        title: "Tonton",
        1: "Tonton",
        artiste_id: "Salif Keita",
        2: "Salif Keita",
        year: "2022",
        3: "2022",
        url: "/uploads/Salif Keita - Tonton (Creacom Afrique Prod).mp3",
        4: "/uploads/Salif Keita - Tonton (Creacom Afrique Prod).mp3",
        image: "/uploads/salif keita.jpeg",
        5: "/uploads/salif keita",
        duration: "3",
        6: "3",
        created_at: "0",
        7: "0",
        created_by: 0,
        8: 0,
        updated_at: "0",
        9: "0",
        updated_by: 0,
        10: 0,
        album_name: "",
        11: "",
        country: "ML",
        12: "ML",
        genre: "",
        13: "",
      },
      {
        id: 9,
        0: 9,
        title: "Last Last",
        1: "Last Last",
        artiste_id: "Burna Boy",
        2: "Burna Boy",
        year: "2022",
        3: "2022",
        url: "/uploads/Lil Zed _Yirila (clip officiel 2022).mp3",
        4: "/uploads/Lil Zed _Yirila (clip officiel 2022).mp3",
        image: "/uploads/burna boy.jpeg",
        5: "/uploads/burna boy.jpeg",
        duration: "3",
        6: "3",
        created_at: "0",
        7: "0",
        created_by: 0,
        8: 0,
        updated_at: "0",
        9: "0",
        updated_by: 0,
        10: 0,
        album_name: "Destin",
        11: "Destin",
        country: null,
        12: null,
        genre: "hip-hop",
        13: "hip-hop",
      },
      {
        id: 10,
        0: 10,
        title: "yirila",
        1: "yirila",
        artiste_id: "lil zed",
        2: "lil zed",
        year: "2022",
        3: "2022",
        url: "/uploads/Lil Zed _Yirila (clip officiel 2022).mp3",
        4: "/uploads/Lil Zed _Yirila (clip officiel 2022).mp3",
        image: "/uploads/lil_zed.jpg",
        5: "/uploads/lil_zed.jpg",
        duration: "3",
        6: "3",
        created_at: "0",
        7: "0",
        created_by: 0,
        8: 0,
        updated_at: "6",
        9: "6",
        updated_by: 2,
        10: 2,
        album_name: "Destin",
        11: "Destin",
        country: null,
        12: null,
        genre: "pop",
        13: "pop",
      },
      {
        id: 11,
        0: 11,
        title: "Diarabi",
        1: "Diarabi",
        artiste_id: "Malakey",
        2: "Malakey",
        year: "2022",
        3: "2022",
        url: "/uploads/Malakey - Diarabi (Clip Officiel).mp3",
        4: "/uploads/Malakey - Diarabi (Clip Officiel).mp3",
        image: "/uploads/malakey.png",
        5: "/uploads/malakey.png",
        duration: "3:00",
        6: "3:00",
        created_at: "0",
        7: "0",
        created_by: 0,
        8: 0,
        updated_at: "0",
        9: "0",
        updated_by: 0,
        10: 0,
        album_name: "",
        11: "",
        country: "ML",
        12: "ML",
        genre: "pop",
        13: "pop",
      },
      {
        id: 12,
        0: 12,
        title: "Dieu donné",
        1: "Dieu donné",
        artiste_id: "Sidiki Diabaté",
        2: "Sidiki Diabaté",
        year: "2022",
        3: "2022",
        url: "/uploads/Malakey - Diarabi (Clip Officiel).mp3",
        4: "/uploads/Malakey - Diarabi (Clip Officiel).mp3",
        image: "/uploads/sidiki_diabaté.jpg",
        5: "/uploads/sidiki_diabaté.jpg",
        duration: "3:00",
        6: "3:00",
        created_at: "0",
        7: "0",
        created_by: 0,
        8: 0,
        updated_at: "0",
        9: "0",
        updated_by: 0,
        10: 0,
        album_name: "",
        11: "",
        country: "ML",
        12: "ML",
        genre: "pop",
        13: "pop",
      },
    ],
  };
  const onLine = window.navigator.onLine
  const toSort = onLine ? songData && [...songData?.data] : indexedSongs && indexedSongs.map((item, index) => ({id: index, attributes: item}) )
  const topPlays =toSort?.sort((a, b) => a.itemM > b.itemM ? 1 : -1).slice(0,5)
  const data = songData?.data

  const toSortArtist =  artistData && [...artistData?.data]
  const TopArtists = toSortArtist?.sort((a, b) => a.itemM > b.itemM ? 1 : -1).slice(0, 5)
  
  const handlePauseClick = () => {
    dispatch(playPause(false))

  }
  const handlePlayClick = (song, i) => {
    console.log(activeSong)
    dispatch(setActiveSong({song, data, i}))
    dispatch(playPause(true))
}

  return (
    <div ref={divRef} className="xl:ml-6 ml-0 xl:mb-0 mb-6 flex-1 xl:max-w-[500px] max-w-full flex flex-col">
      <div className="w-full flex flex-col">
        <div className="flex flex-row justify-between items-center ">
        {console.log('top artist', TopArtists)}
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
          {TopArtists?.map((song,i) => (
            <SwiperSlide 
            key={song.id}
            style={{width: '25%', height: "25%"}}
            className="shadow-lg rounded-full animate-slideright"
            >
              <Link to={`/artists/${song?.id}`}> 
              <img src={`https://api.diabara.tv${song?.attributes?.image?.data[0]?.attributes?.url}`} alt=""  className="rounded-full w-full object-cover" /> 

              </Link>

            </SwiperSlide>
          ))}
        </Swiper>
      </div>



    </div>
  )

}

export default TopPlay;
