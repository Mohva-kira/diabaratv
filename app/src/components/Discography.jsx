import React, { useEffect, useRef, useState } from 'react'
import Input from './Input'
import { TopChartCard } from './TopPlay';
import { useGetSongsQuery } from '../redux/services/songsApi';
import { useSelector } from 'react-redux';
import { Swiper, SwiperSlide } from 'swiper/react';
import { FreeMode } from 'swiper'
import { Link } from 'react-router-dom';
import { useGetAlbumsQuery } from '../redux/services/albums';




const Discography = ({ artistID }) => {
    const ref = useRef()
    const { data: songsData, isFetching, isLoading, isSuccess, isError } = useGetSongsQuery()
    const { data: albumsData, isFetching: isFetchingAlbums, isLoading: isLoadingAlbums, isSucces: isSuccessAlbums, isError: isErrorAlbums } = useGetAlbumsQuery()

    const { activeSong, isPlaying } = useSelector((state) => state.player)
    const [mySongs, setMySongs] = useState()


    const handlePauseClick = () => {
        dispatch(playPause(false))

    }
    const handlePlayClick = (song, i) => {
        console.log(activeSong)
        dispatch(setActiveSong({ song, data, i }))
        dispatch(playPause(true))
    }

    useEffect(() => {
        setMySongs(songsData.data.filter(item => item.attributes.artist.data.id === Number(artistID)))
    }, [isSuccess])

    console.log('mu songs', albumsData)

    return (
        <div className='md:w-3/5 rounded-2xl  sm:w-full flex flex-col p-2 m-2 shadow-lg shadow-orange-600'>
            <div className='w-full mb-10 flex justify-center items-center flex-col flex-wrap gap-4'>
                <h2 className='text-slate-200 text-xl font-semibold  rounded-2xl'>Discographie</h2>


                <div className='w-full h-96 no-scrollbar overflow-y-auto'>
                    {mySongs?.map((song, i) => (

                        <TopChartCard
                            key={song.id}
                            song={song}
                            i={i}
                            isPlaying={isPlaying}
                            activeSong={activeSong}
                            handlePauseClick={handlePauseClick}
                            handlePlayClick={() => handlePlayClick(song, i)}
                        />


                    ))

                    }


                </div>


            </div>


            <div className='w-full mb-10 flex justify-center items-center flex-col flex-wrap gap-4'>
                <h2 className='text-slate-200 text-xl font-semibold   rounded-2xl'>Albums</h2>

                <div className='w-full  '>
                    <Swiper
                        slidesPerView="auto"
                        spaceBetween={15}
                        freeMode
                        centeredSlides
                        centeredSlidesBounds
                        modules={[FreeMode]}
                        className="mt-4"
                    >
                        {albumsData?.data?.map((song, i) => (
                            <SwiperSlide
                                key={song.id}
                                style={{ width: '25%', height: "25%" }}
                                className="shadow-lg rounded-full animate-slideright"
                            >
                                <Link to={`/artists/${song?.id}`}>
                                    <img src={`https://api.diabara.tv${song?.attributes?.image?.data?.attributes?.url}`} alt="" className="rounded-full w-full object-cover" />

                                </Link>

                            </SwiperSlide>
                        ))}
                    </Swiper>

                </div>

            </div>

            <div className='w-full mb-10 flex justify-center items-center flex-col flex-wrap gap-4'>
                <h2 className='text-slate-200 text-xl font-semibold   rounded-2xl'>Clips</h2>
                <div className='w-full flex flex-row'>

                    <Swiper
                        slidesPerView="auto"
                        spaceBetween={15}
                        freeMode
                        centeredSlides
                        centeredSlidesBounds
                        modules={[FreeMode]}
                        className="mt-4 w-full h-[250px]"
                    >

                        <SwiperSlide

                            style={{ width: "70%" }}
                            className="shadow-lg justify-around p-2 m-2 bg-white rounded-full animate-slideright"
                        >
                            <div className='flex h-1/4  justify-around'>
                                papapap
                            </div>
                        </SwiperSlide>

                        <SwiperSlide

                            style={{ width: "70%" }}
                            className="shadow-lg w-1/2  justify-around  p-2 m-2 bg-white rounded-full animate-slideright"
                        >
                            <div className="flex w-1/2  justify-around ">

                            </div>
                        </SwiperSlide>

                        <SwiperSlide

                            style={{ width: "70%" }}
                            className="shadow-lg w-1/2 justify-around  p-2 m-2 bg-white rounded-full animate-slideright"
                        >
                            <div className="flex w-1/2  justify-around ">

                            </div>
                        </SwiperSlide>
                    </Swiper>

                </div>
            </div>

        </div>
    )
}

export default Discography