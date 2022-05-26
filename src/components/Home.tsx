import React, { useState, useEffect } from "react";
import {useAppDispatch, useAppSelector} from "../app/hooks";
import {clearMessage} from "../slices/message";
import   SongList   from "./songList/SongList";
import Watch from "./watch/Watch";
import ArtistList from "./artist/ArtistList";
import Player  from "./audioPlayer/player/Player";
import {useGetSongByNameQuery} from "../features/songs.service";
import song from "../slices/song";
import { VideoPlayer } from "./videoPlayer/VideoPlayer";
import Playlist from "./playlist/Playlist";


const Home = ({props}: any) => {
    const [currentSongIndex, setCurrentSongIndex] = useState(0);
    const [nextSongIndex, setNextSongIndex] = useState(currentSongIndex + 1);
    const [content, setContent] = useState("");
    const {message} = useAppSelector((state: any) => state.message);
    const dispatch = useAppDispatch();
    const {data: songs, error, isLoading} = useGetSongByNameQuery('');
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
            </div>

        </div>
        <div className="row">
            <Playlist/>
        </div>

        <div className="row justify-content-around">
            <div className="col-6">
                {songs ?
                    <SongList songs={songs} setCurrentSongIndex={setCurrentSongIndex}/> : null
                }
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
      

        </>
    );
};
export default Home;