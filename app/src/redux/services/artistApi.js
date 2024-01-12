/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
   import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

   const API_URL = "https://api.diabara.tv/api/";
   
   export const artistsApi = createApi({
     reducerPath: "artistsApi",
     baseQuery: fetchBaseQuery({ baseUrl: API_URL }),
     prepareHeaders: (headers) => {
       headers.set("Content-Type", "application/json")
       headers.set('Authorization', 'Bearer 8a70993be89e3716ab168d6fc9fffe4b9fbd7520a64a7cdcb386f1f4570ce8be532fa5caf9757fa1e04c95c6b1381238acc64bc437d831b07deab1e31b2d4211f5b829766599007896c9e0404f91c0995b54c3ca3df307681556a45518b9520a7299e9e815e31198c838701a74279372ec78e600e55f4575e5885beb28423d2c')
   
     },
     endpoints: (builder) => ({
       // The `getPosts` endpoint is a "query" operation that returns data
       getArtists: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: () => "/artists?populate=*",
       }),
       getArtistDetails: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: (Artistid) => "/artists" + Artistid + "?populate=*" ,
       }),
       getArtistRelated: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: (artisteid) => "all.php?artist=" + artisteid,
       }),
       getArtistByCountry: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: (countryCode) => "all.php?country=" + countryCode,
       }),
       getArtistsByGenre: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: (genre) => "all.php?genre=" + genre,
       }),
       getArtistsBySearch: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: (searchTerm) => "all.php?search=" + searchTerm,
       }),
       addArtist: builder.mutation({
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
     useGetArtistsQuery,
     useGetArtistDetailsQuery,
     useGetArtistRelatedQuery,
     useGetArtistByCountryQuery,
     useGetArtistsByGenreQuery,
     useGetArtistsBySearchQuery,
     useAddArtistMutation,
   } = artistsApi;
   