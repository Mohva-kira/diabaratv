/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
   import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

   const API_URL = "https://api.diabara.tv/api";
   
   export const playlistSongApi = createApi({
     reducerPath: "playlist-songApi",
     baseQuery: fetchBaseQuery({ baseUrl: API_URL,
      prepareHeaders: (headers, { getState }) => {
        const token = getState().auth.auth.token;
        console.log('tok', token)
        if (token) {
          headers.set("authorization", `Bearer ${token}`);
        }
    
        headers.set("Content-Type", "Application/json");
        headers.set("Accept", "Application/json");
    
        return headers;
      },
    
    }),
    
     endpoints: (builder) => ({
       // The `getPosts` endpoint is a "query" operation that returns data
       getPlaylistSongs: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: () => "/playlist-songs?populate=*",
       }),
       postPlaylistSong: builder.mutation({
        // The URL for the request is '/fakeApi/posts'
        query: (data) => ({
            url: "/playlist-songs",
            method: 'POST',
            body: data

    
    }),



      }),

     
      deletePlaylistSong: builder.mutation({
        // The URL for the request is '/fakeApi/posts'
        query: (id) => ({
            url: "/playlist-songs/" +id,
            method: 'DELETE'
            

    
    }),
      }),


     }),


   });
   
   export const {
     useGetPlaylistSongssQuery,
     usePostPlaylistSongsMutation,
     useDeletePlaylistSongsMutation
    
   } = playlistSongApi;
   