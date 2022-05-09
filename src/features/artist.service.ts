import axios from "axios";
import {createApi, fetchBaseQuery} from "@reduxjs/toolkit/dist/query/react";
const API_URL = "http://localhost/diabaraServer/api/";

const createArtist = (name:any, location:any, image:any, create_at:any, status:any, created_user: any) => {
    return axios.post(API_URL + 'create_artist.php', {name, location, image, create_at, status, created_user})
}

const getArtist = createApi({
    reducerPath: "artistApi",
    baseQuery: fetchBaseQuery({ baseUrl: API_URL +  'all.php' }),
    endpoints: (builder) => ({
    fetchArtist: builder.query({
        query: ()=> '',
    })
})
}
)

const ArtistService = {createArtist}

export default ArtistService;

export const {useFetchArtistQuery} = getArtist;