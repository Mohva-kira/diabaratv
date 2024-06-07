import React from 'react'
import { useState, useEffect } from 'react'
import axios from 'axios'
import { useSelector } from 'react-redux'

import { Error, Loader, SongCard } from '../components'
import { useGetSongsQuery } from '../redux/services/songsApi'
import { db } from '../db/db'
import { useLiveQuery } from 'dexie-react-hooks'

const CountryTracks = () => {
const [country, setCountry] = useState('ML')
const [loading, setLoading] = useState(true)
const [bestSongs, setBestSongs] = useState()
const {activeSong, isPlaying}  = useSelector((state) => state.player)
const { data, isFetching, error } = useGetSongsQuery()
const indexedSongs = useLiveQuery(() => db.songs.toArray());
const indexedStreams = useLiveQuery(() => db.streamsData.toArray());

const offLineSongs = indexedSongs?.map((item, index) => ({
      id: index,
      attributes: item,
    }))
const {onLine} = window.navigator


useEffect(() => {

    if(data ){
    const songsData = [...data?.data] 
    console.log('song data', songsData)
    setBestSongs(onLine ? songsData.reverse() : indexedSongs.reverse()) 

}

    return bestSongs
}, [data])



if(isFetching && loading) return <Loader title='Loading songs arround you' />

if(error && !indexedSongs ) return <Error />




return (
    <div className="flex flex-col">
        <h2 className="font-bold text-3xl text-white text-left mt-4 mb-10">
             <span className="font-black">{"Les meilleurs du moments"}</span>
        </h2>
{console.log('indexed streams', indexedSongs)}
    
    
    <div className="flex flex-wrap sm:justify-start justify-center gap-8">
        {onLine ? bestSongs?.map((song, i) => (
            <SongCard 
                key={song?.id}
                song={song}
                isPlaying={isPlaying}
                data={bestSongs}
                i={i}
                activeSong={activeSong}
                streams={ indexedStreams && indexedStreams?.filter(
                  (item) => item.song && item?.song.data.id === song.id,
                ) }
            />
        ))
        : offLineSongs?.map((song, i) => (
            <SongCard 
                key={song?.id}
                song={song}
                isPlaying={isPlaying}
                data={bestSongs}
                i={i}
                activeSong={activeSong}
                streams={ indexedStreams && indexedStreams?.filter(
                  (item) => item.song && item?.song.data.id === song.id,
                ) }
            />
        ))
    } 
    </div>
        
    </div>
)
  };

export default CountryTracks;
