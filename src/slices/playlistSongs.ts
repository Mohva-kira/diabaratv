import { createSlice } from "@reduxjs/toolkit";
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/dist/query/react";
import playlist from "./playlist";


const API_URL = "http://localhost/diabaraServer/api"

const initialState = {
   playlistSongs: [],
   status: 'idle',
   error: null

}

export const playlistSongsApi = createApi({
    reducerPath: "playlistSongsApi",
    baseQuery: fetchBaseQuery({baseUrl: API_URL}),
    tagTypes: ["playlistSongs"],
    endpoints: builder =>( {
        getPlaylistSongs: builder.query( {
            query: (id) => `get_playlist_songs.php?id=${id}`,
            providesTags: ["playlistSongs"]
        }),
        removeFromPlaylist: builder.mutation({
            query: (data) => ({
                url: '/delete_from_playlist.php',
                method:'POST',
                body: data
            }),
            invalidatesTags: ["playlistSongs"]
        
        })
        
    })

})


const playlistSongsSlice = createSlice({
    name:'playlistSongs',
    initialState,
    reducers: {},

    extraReducers(builder){
        builder.addMatcher(playlistSongsApi.endpoints.getPlaylistSongs.matchFulfilled, (state: any, action: any) => {
            state.playlistSongs.push(action.payload.data)
        })
    }
})




export const {useGetPlaylistSongsQuery, useRemoveFromPlaylistMutation} = playlistSongsApi
export default playlistSongsSlice.reducer