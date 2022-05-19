import React, {useEffect, useState}  from "react";
import  {useFetchArtistQuery} from "../../features/artist.service"
import './artistList.css'
import Icon from "../svg/svg";


const ArtistList = () => {
    const {data, error, isLoading} = useFetchArtistQuery('');

    return(<div className="list-inline-item ">
        {error ? (
            <>Oh no, there was an error</>
        ) : isLoading ? (
            <>Loading...</>
        ) : data ? (<>
            {data.data.map((data: any, index: any): any => (

                <div className="song-item m-2 p-2 mb-4" key={index}>
                    <div className=" m-3 p-3 mb-3 align-items-center justify-content-around w-100 ">
                        <div className="d-inline-flex justify-content-start w-100">
                            <div className="d-flex gap-4">
                                <img className="artist-img" src={`http://localhost/diabaraServer${data.image}`} alt={data.name}/>
                            </div>
                            <div className=" title mt-2">
                                <div className="w-100">
                                    <p className="text-primary mb-0 fw-bold small ">{data.name}</p>
                                </div>
                                <div className="d-flex followers">
                                    <div className=" mr-2">
                                        <Icon name="person-hearts"/>
                                    </div>
                                    <div className="position-relative top-0 ">
                                        <p className="text-secondary mt-1 "> 123k Followers </p>

                                    </div>
                                    <div className=" mr-2">
                                        <Icon name="soundwave"/>
                                    </div>
                                    <div className="position-relative top-0 ">
                                        <p className="text-secondary mt-1 "> 123M </p>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>))}

        </>) : null

        }



    </div>)
}

export default ArtistList;