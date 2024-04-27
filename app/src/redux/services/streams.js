/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
import { createSlice } from "@reduxjs/toolkit";
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

const API_URL = "https://api.diabara.tv/api";
const initialState = {
  data: null,
};

export const streamsApi = createApi({
  reducerPath: "streams",
  baseQuery: fetchBaseQuery({
    baseUrl: API_URL,
    prepareHeaders: (headers, { getState }) => {
      const storageUser = JSON.parse(localStorage.getItem("auth"));
      const token = getState().auth.auth.token
        ? getState().auth.auth.token
        : storageUser?.jwt;
      // console.log("tok", token);
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
    getStreams: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: () => "/streams?populate=*&pagination[start]=0&pagination[limit]=1000",
    }),
    postStreams: builder.mutation({
      // The URL for the request is '/fakeApi/posts'
      query: (data) => ({
        url: "/streams",
        method: "POST",
        body: data,
      }),
    }),

    deleteStreams: builder.mutation({
      // The URL for the request is '/fakeApi/posts'
      query: (id) => ({
        url: "/streams/" + id,
        method: "DELETE",
      }),
    }),
  }),
});



const StreamsSlice = createSlice({
  name: "Streams",
  initialState,
  reducers: {
    setStreams:  (state, action) => {
        
      state.data = action.payload
    },
  
  },
});

export const {
  useGetStreamsQuery,
  usePostStreamsMutation,
  useDeleteStreamsMutation,
} = streamsApi;

export const { setStreams } = StreamsSlice.actions;

export default StreamsSlice.reducer;
