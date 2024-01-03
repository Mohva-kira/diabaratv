import React from 'react'
import { useState, useEffect } from 'react'
import axios from 'axios'
import { useSelector } from 'react-redux'

import { Error, Loader, SongCard } from '../components'
import { useGetSongsQuery } from '../redux/services/songsApi'


const CountryTracks = () => {
const [country, setCountry] = useState('')
const [loading, setLoading] = useState(true)
const [bestSongs, setBestSongs] = useState()
const {activeSong, isPlaying}  = useSelector((state) => state.player)
const { data, isFetching, error } = useGetSongsQuery()



if(isFetching && loading) return <Loader title='Loading songs arround you' />

if(error && country) return <Error />

useEffect(() => {
    const songsData =  [...data?.data]
    console.log('song data', songsData)
    setBestSongs(songsData.sort((a,b) => a -b)) 

    return bestSongs
}, [data])



return (
    <div className="flex flex-col">
        <h2 className="font-bold text-3xl text-white text-left mt-4 mb-10">
             <span className="font-black">{"Les meilleurs du moments"}</span>
        </h2>

    {console.warn('song data', bestSongs)}
    
    <div className="flex flex-wrap sm:justify-start justify-center gap-8">
        {bestSongs?.map((song, i) => (
            <SongCard 
                key={song?.id}
                song={song}
                isPlaying={isPlaying}
                data={bestSongs}
                i={i}
                activeSong={activeSong}
            
            />
        ))}
    </div>
        
    </div>
)
};

export default CountryTracks;
