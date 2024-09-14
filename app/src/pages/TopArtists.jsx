import React from 'react'

import axios from 'axios'


import { ArtistCard, Loader, SongCard } from '../components'
import { useGetSongsQuery,  } from '../redux/services/songsApi'
import { useGetArtistsQuery } from '../redux/services/artistApi'
import { useLiveQuery } from 'dexie-react-hooks';
import { db } from '../db/db';



const TopArtists = () => {
const { data, isFetching, error } = useGetArtistsQuery()
const {onLine} = window.navigator


  const indexedArtists = useLiveQuery(() => db.artists.toArray());

if(isFetching ) return <Loader title='Loading Top charts' />

if(onLine && error ) return <Error />

 
// const isFetching = false
// const error = false

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

console.log('data', data)

return (
    <div className="flex flex-col">
        <h2 className="font-bold text-3xl text-white text-left mt-4 mb-10">
            Top Artists 
        </h2>
    <div className="flex flex-wrap sm:justify-start justify-center gap-8">
        {onLine ? data?.data?.map((track, i) => (
            <ArtistCard 
            key={track.id}
            track={track}
            />
        ))
        : indexedArtists?.map((track, i) => (
            <ArtistCard 
            key={track.id}
            track={track}
            />
        ))

      
      }
    </div>
        
    </div>
)
};

export default TopArtists;
