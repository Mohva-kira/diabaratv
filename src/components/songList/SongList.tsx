import * as React from "react";
import {useGetSongByNameQuery} from '../../features/songs.service'
import {useEffect, useState} from "react";
import './songList.css'
import Icon from "../svg/svg";

const SongList = (props: any) => {
    const {data: songs, error, isLoading} = useGetSongByNameQuery('');

    useEffect(() => {
        console.log(songs)
    }, [songs])
    return (
        <div className="list-group w-100 h-50">

            {error ? (
                <>Oh no, there was an error</>
            ) : isLoading ? (
                <>Loading...</>
            ) : songs ? (
                <>
                    {songs.data.map((data: any, index: any): any => (

                        <div className="list-inline-item song-item m-2 p-2 mb-4" key={index}>
                            <div className="d-inline-flex m-3 p-3 mb-3 align-items-center justify-content-around w-100 ">
                                <div className="d-inline-flex justify-content-start w-50">
                                    <div className="d-flex gap-4">
                                    <span className="text-secondary small m-2 mr-2 mt-3"> {data.id} </span>
                                    <img className="song-img" src={`http://localhost/diabaraServer${data.image}`} alt={data.title}/>
                                    </div>
                                    <div className="title ">
                                        <div className="mt-2">
                                            <h6 className="text-primary small ">{data.title}</h6>
                                        </div>
                                        <div className="d-flex">
                                            <div className="mt-1">
                                                <Icon name="person"/>
                                            </div>
                                            <div className="position-relative top-0 ">
                                                <p className="text-secondary small "> {data.artiste_id} </p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div className="d-flex justify-content-center gap-4 play w-50">

                                    <div className="d-flex small text-primary mt-1 w-25 justify-content-end" >
                                     <p className="small fw-bold text-primary ">  {data.duration}</p>
                                    </div>
                                    <div className="">
                                        <Icon name="play-circle"/>
                                    </div>
                                    <div className="dots mt-1">
                                        <Icon name="three-dots-vertical"/>
                                    </div>
                                </div>
                            </div>

                        </div>))}

                </>
            ) : null}


        </div>
    )

}

export default SongList;