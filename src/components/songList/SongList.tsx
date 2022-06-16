import * as React from "react";
import { useGetSongByNameQuery } from '../../features/songs.service'
import { useEffect, useRef, useState } from "react";
import './songList.css'
import Icon from "../svg/svg";
import Popup from "../popup/Popup";
import AddPlaylist from "../form/playlist/AddPlaylist";
import { useAddPlaylistMutation, useGetPlaylistQuery } from "../../slices/playlist";
import { useAppSelector } from "../../app/hooks";
import AddToPlaylist from "../form/playlist/AddToPlaylist";

const SongList = (props: any) => {
    // const {data: songs, error, isLoading} = useGetSongByNameQuery('');
    const [duration, setDuration] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const audioRef = useRef(new Array(Number(props.songs.data.length)));
    const [buttonPopup, setButtonPopup] = useState(false);
    const [song, setSong] = useState();
   
    const { user: currentUser } = useAppSelector((state: any) => state.auth);
   
    const {data: playlists, isSuccess, isError, isFetching} = useGetPlaylistQuery(currentUser.id)
   
    useEffect(() => {


        console.log(audioRef)

        function getTrackLength(track: any) {

            track.addEventListener("loadedmetadata", function () {
                // @ts-ignore
                setDuration(duration => [...duration, track.duration]);
            });
        }

        for (let i = 0; i < audioRef.current.length; i++) {
            getTrackLength(audioRef.current[i]);
        }

        setIsLoading(false)


    }, [])

    const handleSong = (data: any) => { 
        setSong(data)
    }
    function secondsToHms(d: any) {
        d = Number(d);
        var h = Math.floor(d / 3600);
        var m = Math.floor(d % 3600 / 60);
        var s = Math.floor(d % 3600 % 60);

        var hDisplay = h > 0 ? h + (h == 1 ? " hour, " : " hours, ") : "";
        var mDisplay = m > 0 ? m + (m == 1 ? " :" : " : ") : "";
        var sDisplay = s > 0 ? s + (s == 1 ? " " : " ") : "";
        return hDisplay + mDisplay + sDisplay;
    }

    const handleCurrentSongIndex = (id: any) => {
        props.setCurrentSongIndex(() => {
            return id
        });
    }

  
    return (
        <div className="list-group w-100 h-50">

            {!props.songs ? (
                <>Oh no, there was an error</>
            ) : isLoading ? (
                <>Loading...</>
            ) : props.songs ? (
                <>

                    {props.songs.data.map((data: any, index: any): any => (

                        <div className="list-inline-item song-item gap-2" key={index}>
                            <div
                                className="d-inline-flex  align-items-center justify-content-around w-100 ">
                                <div className="d-inline-flex justify-content-start w-50">
                                    <div className="d-flex gap-4">
                                        <span className="text-secondary small m-2 mr-2 mt-3"> {data.id} </span>
                                        <img className="song-img" src={`http://localhost/diabaraServer${data.image}`}
                                            alt={data.title} />
                                    </div>
                                    <div className="title ">
                                        <div className="mt-2">
                                            <h6 className="text-primary small ">{data.title}</h6>
                                        </div>
                                        <div className="d-flex">
                                            <div className="me-2  ">
                                                <Icon name="person" />
                                            </div>
                                            <div className=" ">
                                                <p className="text-secondary small "> {data.artiste_id} </p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div className="d-flex justify-content-center gap-4 play w-50">

                                    <div
                                        className="d-flex small text-primary mt-1 w-25 justify-content-end align-items-end">
                                        <p className="small fw-bold text-primary ">  {secondsToHms(duration[index])}</p>
                                    </div>
                                    <div className="">
                                        <button onClick={() => handleCurrentSongIndex(index)} type="button"
                                            className="btn  rounded-circle"><Icon name="play-circle" /></button>
                                        <audio
                                            ref={(el) => (audioRef.current[index] = el)}
                                            src={`http://localhost/diabaraServer${data.url}`}

                                        />
                                    </div>
                                    <div className="dots d-flex align-items-center">
                                        <div className="dropdown">
                                            <a href="#" className="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                                                id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                                <Icon name="three-dots-vertical" />
                                            </a>


                                            <ul className="dropdown-menu dropdown-menu-dark text-small shadow">
                                                <li className="item">
                                                    <button className="btn text-white" onClick={() => {setButtonPopup(true), handleSong(data)}}>
                                                        Add to playlist
                                                    </button>

                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            
                        </div>))}

                </>
            ) : null}

            <>
                            
            <Popup trigger={buttonPopup} setTrigger={setButtonPopup} >
                                <div >
                                
                                      <AddPlaylist />
                                <div>
                                    { isSuccess ? (
                                            <>

                                                <AddToPlaylist song={song} playlists={playlists.data} />
                                                
                                            </>
                                         ) : null

                                    }
                                </div>
                                </div>

                            </Popup>


            </>
        </div>
    )

}

export default SongList;