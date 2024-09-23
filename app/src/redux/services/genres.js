/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
   import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

   const API_URL = import.meta.env.VITE_API_URL;
   const API_KEY = import.meta.env.VITE_API_KEY;
   
   export const genresApi = createApi({
     reducerPath: "diabaraTvGenresApi",
     baseQuery: fetchBaseQuery({ baseUrl: API_URL }),
     prepareHeaders: (headers) => {
       headers.set("Content-Type", "application/json")
       headers.set('Authorization', `${API_KEY}`)
   
     },
     endpoints: (builder) => ({
       // The `getPosts` endpoint is a "query" operation that returns data
       getGenres: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: () => "/Genres?populate=*&pagination[pageSize]=1000",
       }),
       
       getGenresBySearch: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: (searchTerm) => "all.php?search=" + searchTerm,
       }),
     
     }),
   });
   
   export const {
     useGetGenresQuery,
  
     useGetGenresBySearchQuery,

   } = genresApi;
   

   import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  genres: [],
};

const GenresSlice = createSlice({
  name: 'Genres',
  initialState,
  reducers: {
    setGenres: (state, action) => {
      console.error('active', action.payload)
      localStorage.setItem('genre', JSON.stringify(action.payload))
      state.genres = action.payload;
     
      
    },

  },
});

export const { setGenres } = GenresSlice.actions;

export default GenresSlice.reducer;
