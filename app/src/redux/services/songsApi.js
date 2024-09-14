/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

const API_URL = import.meta.env.VITE_API_URL;

export const songsApi = createApi({
  reducerPath: "diabaraTvApi",
  baseQuery: fetchBaseQuery({ baseUrl: API_URL }),
  prepareHeaders: (headers) => {
    headers.set("Content-Type", "application/json")
    headers.set('Authorization', 'Bearer 8a70993be89e3716ab168d6fc9fffe4b9fbd7520a64a7cdcb386f1f4570ce8be532fa5caf9757fa1e04c95c6b1381238acc64bc437d831b07deab1e31b2d4211f5b829766599007896c9e0404f91c0995b54c3ca3df307681556a45518b9520a7299e9e815e31198c838701a74279372ec78e600e55f4575e5885beb28423d2c')

  },
  endpoints: (builder) => ({
    // The `getPosts` endpoint is a "query" operation that returns data
    getSongs: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: () => "/songs?populate=*&pagination[pageSize]=1000",
    }),
    getSongDetails: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: (songid) => "/songs/" + songid + "/?populate=*",
    }),
    getSongRelated: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: (artisteid) => "songs?filters[artist][id][$eq]=" + artisteid,
    }),
    getSongByArtist: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: (artisteid) => "songs?filters[artist][id][$eq]=" + artisteid,
    }),
    getSongByCountry: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: (countryCode) => "/songs?fields[0]=ville" + countryCode +"populate=*", 
    }),
    getSongsByGenre: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: (genre) => "all.php?genre=" + genre,
    }),
    getSongsBySearch: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: (searchTerm) => "all.php?search=" + searchTerm,
    }),
    addSong: builder.mutation({
      // The URL for the request is '/fakeApi/posts'
      query: (data) =>( {
        url: 'upload',
        body: data,
        method: 'POST',
         
      })
    }),
  }),
});

export const {
  useGetSongsQuery,
  useGetSongDetailsQuery,
  useGetSongRelatedQuery,
  useGetSongByCountryQuery,
  useGetSongsByGenreQuery,
  useGetSongsBySearchQuery,
  useAddSongMutation,
  useGetSongByArtistQuery,
} = songsApi;
