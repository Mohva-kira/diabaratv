/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
   import { createSlice } from "@reduxjs/toolkit";
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

   const API_URL = "https://api.diabara.tv/api";
   const initialState = {
  data: null,
};
   export const albumsApi = createApi({
     reducerPath: "albums",
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
       getAlbums: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: () => "/albums?populate=*",
       }),
       postAlbum: builder.mutation({
        // The URL for the request is '/fakeApi/posts'
        query: (data) => ({
            url: "/albums",
            method: 'POST',
            body: data

    
    }),



      }),

     
      deleteAlbum: builder.mutation({
        // The URL for the request is '/fakeApi/posts'
        query: (id) => ({
            url: "/albums/" +id,
            method: 'DELETE'
            

    
    }),
      }),


     }),


   });
   

   const AlbumsSlice = createSlice({
  name: "Albums",
  initialState,
  reducers: {
    setDownloads:  (state, action) => {
        
      state.data = action.payload
    },
  
  },
});

   export const {
     useGetAlbumsQuery,
     usePostAlbumMutation,
     useDeleteAlbumMutation
    
   } = albumsApi;
   
export default AlbumsSlice.reducer;
