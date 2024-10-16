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
