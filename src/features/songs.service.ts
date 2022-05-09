import authHeader from "./auth-header";
import axios from "axios";
import {createApi, fetchBaseQuery} from "@reduxjs/toolkit/dist/query/react";
const API_URL = "http://localhost/diabaraServer/api/";

const createSong = (title: any, artiste_id: any, year: any, duration: any, url: any, image: any) => {
 return axios.post(API_URL + "create_song.php", {
     title,
     artiste_id,
     year,
     duration,
     url,
     image
 });
};

export const songApi = createApi({
    reducerPath: 'songsApi',
    baseQuery: fetchBaseQuery({ baseUrl: API_URL +  'all.php' }),
    endpoints: (builder )  => ({
        getSongByName: builder.query({
            query: () => ``,
        }),
    }),
})
const updateSong = (id: any, data:any) =>{
    return axios.post(API_URL + "update_song.php", data)
}

const SongServices = {createSong, updateSong}

export default  SongServices;
export const { useGetSongByNameQuery } = songApi;