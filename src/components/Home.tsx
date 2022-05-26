import React, { useState, useEffect } from "react";
import UserService from "../features/user.service";
import {useAppDispatch, useAppSelector} from "../app/hooks";
import {clearMessage} from "../slices/message";
import   SongList   from "./songList/SongList";
import Watch from "./watch/Watch";
import ArtistList from "./artist/ArtistList";
import Playlist from "./playlist/Playlist";

const Home = () => {
    // const {isContent} = useAppSelector((state: any) => state.songs);
    const [content, setContent] = useState("");
    const {message} = useAppSelector((state: any) => state.message);
    const dispatch = useAppDispatch();

    useEffect(() => {
        dispatch(clearMessage())
    }, [dispatch])

    return (
        <>
        <div className="row d-flex justify-content-around">
            <div className="col-6">
                <Watch/>
            </div>

            <div className="col-5">
                <ArtistList/>
            </div>

        </div>
        <div className="row">
            <Playlist/>
        </div>

        <SongList/>

        </>
    );
};
export default Home;