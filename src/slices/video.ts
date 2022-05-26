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


export const videoApi = createApi({
    reducerPath: 'videoApi',
    baseQuery: fetchBaseQuery({baseUrl: API_URL + 'get_videos.php' }),
    endpoints: (builder) => ({
        getVideos: builder.query({
            query: () => '/videos',
        })
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
    reducers: {
        videoAdded: {
            reducer(state: any, action: any) {
                state.videos.push(action.payload)
            },
            prepare(title: any, artiste_id: any, year: any, url: any, image: any, createAt: any, createdBy: any): any{

            },
         
        },
           reactionAdded(state: any, action: any) {
                const {videoId, reaction} = action.payload
                const existingVideo = state.videos.find((video: any) => video.id === videoId)
                if (existingVideo) {
                    existingVideo.reactions[reaction]++
                }
            },
            videoUpdated(state: any, action: any) {
                const {id, title, artiste_id, url, image, createAt, createdBy, updatedAt, updatedBy} = action.payload
                const existingVideo = state.videos.find((video: any) => video.id === id)

                if(existingVideo) {
                    existingVideo.title = title
                    existingVideo.image = image
                    existingVideo.artiste_id = artiste_id
                    existingVideo.url = url
                    existingVideo.updatedAt = updatedAt
                    existingVideo.updatedBy = updatedBy
                }
            }
    }
});

export const { useGetVideosQuery } = videoApi


export const {videoAdded, videoUpdated, reactionAdded} = videosSlice.actions

export default videosSlice.reducer
export const selectAllVideos = (state:any) => state.videos
export const selectVideoById = (state: any, videoId: any) => state.videos.find((video: any) => video.id === videoId)