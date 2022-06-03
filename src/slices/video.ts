import React from 'react'
import { createAsyncThunk, createSlice } from '@reduxjs/toolkit'
import VideoServices from '../features/video.service'
import { setMessage } from './message';
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/dist/query/react';

const API_URL = "http://localhost/diabaraServer/api/";

export const createVideo = createAsyncThunk(
    "video/creation",
    async ({title, artiste_id, url, image, createdAt, createdBy} : any, thunkAPI) => {
        try {
            const response = await VideoServices.createVideo(title, artiste_id, url, image, createdAt, createdBy);
            thunkAPI.dispatch(setMessage(response.data))
        }
        catch (error: any){

            const message =
                (error.response &&
                    error.response.data &&
                    error.response.data.message) ||
                error.message ||
                error.toString();
            thunkAPI.dispatch(setMessage(message));
            return thunkAPI.rejectWithValue(error.response);
        }
    }
)

export const updateVideo = createAsyncThunk(
    "video/udapte",
    async ({id, title, artiste_id, url, image, updatedAt, updatedBy}: any, thunkAPI) => {
        try {
            const response = await VideoServices.updateVideo(id, title, artiste_id, url, image, updatedAt, updatedBy);
            thunkAPI.dispatch(setMessage(response.data))
        } catch (error: any) {
            const message =
            (error.response &&
                error.response.data &&
                error.response.data.message) ||
            error.message ||
            error.toString();
        thunkAPI.dispatch(setMessage(message));
        return thunkAPI.rejectWithValue(error.response);
        }
       
    }
)

export const videoApi = createApi({
    reducerPath: 'videoApi',
    baseQuery: fetchBaseQuery({baseUrl: API_URL  }),
    endpoints: (builder) => ({
        getVideos: builder.query({
            query: () => '/get_videos.php',
        }),
        getVideo: builder.query({
           query: (id) => `/get_video.php?id=${id}`, 
        }),
        addVideo: builder.mutation({
            query: video => ({
                url:'/create_video.php/',
                method: 'POST',
                body: video}),

        }),
        updateVideo: builder.mutation({
            query: ({id, ...rest}) => ({
                url:`/update_video.php?id=${id}`,
                method: 'PUT',
                body: rest,
                headers: {
                    "Content-type": "application/json; charset=UTF-8",
                  },}),

        }),
        deleteVideo: builder.mutation({
            query: (id) => ({
                url:`/delete_video.php?id=${id}`,
                method: 'DELETE',
                }),

        }),
    })
})


const initialState = {
    videos: [],
    status: 'idle',
    error: null
  }

const videosSlice = createSlice({
    name: 'videos',
    initialState,
    reducers: {}, 

    extraReducers(builder) {
        builder.addCase(updateVideo.fulfilled, (state: any, action: any) => {
            state.videos.push(action.payload)
        })
    }
});

export const { 
    useGetVideosQuery,
     useGetVideoQuery, 
     useAddVideoMutation, 
     useUpdateVideoMutation, 
     useDeleteVideoMutation 
    } = videoApi


// export const {videoAdded, videoUpdated, reactionAdded} = videosSlice.actions

export default videosSlice.reducer
export const selectAllVideos = (state:any) => state.videos
export const selectVideoById = (videoId: any) => useGetVideoQuery(videoId)