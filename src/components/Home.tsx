import React, { useState, useEffect } from "react";
import {useAppDispatch, useAppSelector} from "../app/hooks";
import {clearMessage} from "../slices/message";
import   SongList   from "./songList/SongList";
import Watch from "./watch/Watch";
import ArtistList from "./artist/ArtistList";
import Player  from "./audioPlayer/player/Player";
import {useGetSongByNameQuery} from "../features/songs.service";
import Playlist from "./playlist/Playlist";
import VideoList from "./videoList/VideoList";
import Popup from "./popup/Popup";


const Home = ({props}: any) => {
    const [currentSongIndex, setCurrentSongIndex] = useState(0);
    const [nextSongIndex, setNextSongIndex] = useState(currentSongIndex + 1);
    const [content, setContent] = useState("");
    const {message} = useAppSelector((state: any) => state.message);
    const dispatch = useAppDispatch();
    const {data: songs, error, isLoading} = useGetSongByNameQuery('');
    const [buttonPopup, setButtonPopup] = useState(false)
    useEffect(() => {
        setNextSongIndex((): any  => {
            if(currentSongIndex +1 > songs?.data.length - 1) {
                return 0
            } else {
                return currentSongIndex + 1;
            }
        })
        }, [currentSongIndex])

    useEffect(() => {
        dispatch(clearMessage())

    }, [dispatch])

    return (
        <>

        <div className="row d-flex justify-content-around">
            <div className="col-6">
                <Watch/>
            </div>
                
               
            <div className="col-3">
                <ArtistList/>
                <button onClick={() => setButtonPopup(true)}>Open popup</button>
            </div>

        </div>

        <div className="row justify-content-around">
            <div className="col-6 flex justify-content-around">
                <div className="mb-4">
                    <Playlist />
                </div>
                <div className="mb-4">
                {songs ?
                    <SongList songs={songs} setCurrentSongIndex={setCurrentSongIndex}/> : null
                }
                </div>

                 <div className="">
                     <VideoList/>
                    
                 </div>

            </div>
            <div className="col-3">
              {songs?
                  <Player
                      songs={songs}
                      currentSongIndex={currentSongIndex}
                      setCurrentSongIndex={setCurrentSongIndex}
                      nextSongIndex={nextSongIndex}
                        />
                      : null
               }
            </div>
        </div>

        <div className="row justify-content-between">
          
        </div>

        <Popup trigger={buttonPopup} setTrigger={setButtonPopup}>
                    
                    <h3>
                        My popup
                    </h3>
                    <p>
                        My popup qui a trigerré 
                    </p>
                </Popup>

        </>
    );
};
export default Home;