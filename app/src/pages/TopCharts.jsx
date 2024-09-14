import React from 'react'

import axios from 'axios'
import { useSelector } from 'react-redux'

import { Error, Loader, SongCard } from '../components'
import { useGetSongsQuery,  } from '../redux/services/songsApi'


const TopCharts = () => {

const {activeSong, isPlaying}  = useSelector((state) => state.player)
const { data, isFetching, error } = useGetSongsQuery()


if(isFetching ) return <Loader title='Loading Top charts' />

if(error && country) return <Error />

return (
    <div className="flex flex-col">
        <h2 className="font-bold text-3xl text-white text-left mt-4 mb-10">
            Decrouve le top classement
        </h2>
    <div className="flex flex-wrap sm:justify-start justify-center gap-8">
        {data?.data?.map((song, i) => (
            <SongCard 
                key={song.id}
                song={song}
                isPlaying={isPlaying}
                data={data.data}
                activeSong={activeSong}
                i={i}
            />
        ))}
    </div>
        
    </div>
)
};

export default TopCharts;
