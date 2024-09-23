/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
   import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

   const API_URL = import.meta.env.VITE_API_URL;
   const API_KEY = import.meta.env.VITE_API_KEY;
   
   export const visitorApi = createApi({
     reducerPath: "diabaraTvVisitorsApi",
     baseQuery: fetchBaseQuery({ baseUrl: API_URL }),
     prepareHeaders: (headers) => {
       headers.set("Content-Type", "application/json")
       headers.set('Authorization', `${API_KEY}`)
   
     },
     endpoints: (builder) => ({
       // The `getPosts` endpoint is a "query" operation that returns data
       getVisitors: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: () => "/Visitors?populate=*&pagination[pageSize]=1000",
       }),
       getVisitorsByUUID: builder.query({
        // The URL for the request is '/fakeApi/posts'
        query: (uuid) => "/Visitors?populate=*&filters[uuid][$equal]"+uuid,
      }),
       getVisitorsBySearch: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: (searchTerm) => "all.php?search=" + searchTerm,
       }),
     
     }),
   });
   
   export const {
     useGetVisitorsQuery,
     useGetVisitorsByUUIDQuery,
     useGetVisitorsBySearchQuery,

   } = visitorApi;
   

   import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  visitor: [],
};

const VisitorsSlice = createSlice({
  name: 'Visitors',
  initialState,
  reducers: {
    setVisitors: (state, action) => {
      console.error('active', action.payload)
      localStorage.setItem('genre', JSON.stringify(action.payload))
      state.visitor = action.payload;
     
      
    },

  },
});

export const { setVisitors } = VisitorsSlice.actions;

export default VisitorsSlice.reducer;
