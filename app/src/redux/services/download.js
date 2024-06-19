/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
import { createSlice } from "@reduxjs/toolkit";
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

const API_URL = "https://api.diabara.tv/api";
const initialState = {
  data: null,
};

export const downloadsApi = createApi({
  reducerPath: "downloads",
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
    getDownloads: builder.query({
      // The URL for the request is '/fakeApi/posts'
      query: () => "/downloads?populate=*&pagination[start]=0&pagination[limit]=1000",
    }),
    postDownloads: builder.mutation({
      // The URL for the request is '/fakeApi/posts'
      query: (data) => ({
        url: "/downloads",
        method: "POST",
        body: data,
      }),
    }),

    deleteDownloads: builder.mutation({
      // The URL for the request is '/fakeApi/posts'
      query: (id) => ({
        url: "/downloads/" + id,
        method: "DELETE",
      }),
    }),
  }),
});



const DownloadsSlice = createSlice({
  name: "Downloads",
  initialState,
  reducers: {
    setDownloads:  (state, action) => {
        
      state.data = action.payload
    },
  
  },
});

export const {
  useGetDownloadsQuery,
  usePostDownloadsMutation,
  useDeleteDownloadsMutation,
} = downloadsApi;

export const { setDownloads } = DownloadsSlice.actions;

export default DownloadsSlice.reducer;
