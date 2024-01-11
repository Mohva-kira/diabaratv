/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
   import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

   const API_URL = "https://api.diabara.tv/api/";
   
   export const artistsApi = createApi({
     reducerPath: "artistsApi",
     baseQuery: fetchBaseQuery({ baseUrl: API_URL }),
     prepareHeaders: (headers) => {
       headers.set("Content-Type", "application/json")
       headers.set('Authorization', 'Bearer 62d0d2e76bb51ed68c6def936fd63c50b3974d408d668699dabaaee5198989f3d8d56306798d3a2464fc17d6dedb6e623ae206ac1a14c2d63495503c26ced87f7102f53cd80454f292b4fe2fee94256fc2f4af45eb4784e493b937aab5c6678b1735d1bd7930c97635cc13cc10bfad4e64a0b809d2c8daf1ec44088789d20a6b')
   
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
   