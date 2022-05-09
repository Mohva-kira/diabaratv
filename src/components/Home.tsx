import React, { useState, useEffect } from "react";
import UserService from "../features/user.service";
import {useAppDispatch, useAppSelector} from "../app/hooks";
import {clearMessage} from "../slices/message";
import   SongList   from "./songList/SongList";
import Watch from "./watch/Watch";


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

        <Watch/>
        <SongList/>

        </>
    );
};
export default Home;