import { createSlice } from "@reduxjs/toolkit";
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/dist/query/react";


const API_URL = "http://localhost/diabaraServer/api"

const initialState = {
   playlists: [],
   status: 'idle',
   error: null

}

export const playlistApi = createApi({
reducerPath: "playlistApi",
baseQuery: fetchBaseQuery({ baseUrl: API_URL}),
endpoints: (builder) => ({
        getPlaylist: builder.query({
            query: (userId) => `/get_playlist.php?user_id=${userId}`
        }),
        addPlaylist: builder.mutation({
            query: (data) => ({
                url: '/create_playlist.php',
                method: 'POST',
                body: data}),

        }),
        addToPlaylist: builder.mutation({
            query: (data) => ({
                url: '/add_playlist_song.php',
                method: 'POST',
                body: data}),

        }),
      
})

})

const playlistSlice = createSlice({
    name: 'playlist',
    initialState,
    reducers: {}, 

    extraReducers(builder) {
        builder.addMatcher(playlistApi.endpoints.getPlaylist.matchFulfilled, (state: any, action: any) => {
            state.playlists.push(action.payload.data)
        })
        builder.addMatcher(playlistApi.endpoints.addPlaylist.matchFulfilled, (state: any, action: any) => {
            state.playlists.push(action.payload.data)
        })
        // builder.addMatcher(playlistApi.endpoints.addToPlaylist.matchFulfilled, (state: any, action: any) => {
        //     state.playlists.push(action.payload.data)
        // })
    }
});

export const {useGetPlaylistQuery, useAddPlaylistMutation, useAddToPlaylistMutation} = playlistApi;
export default playlistSlice.reducer