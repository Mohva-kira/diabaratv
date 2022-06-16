import { configureStore } from "@reduxjs/toolkit";

import authReducer from "../slices/auth"
import messageReducer from "../slices/message"
import userService from "../features/user.service";
import { songApi } from "../features/songs.service"
import { getArtist } from "../features/artist.service";
import songsReducer from "../slices/song"
import videosReducer, {videoApi} from "../slices/video"
import playlistReducer, {playlistApi} from "../slices/playlist"
import playlistSongsReducer, {playlistSongsApi} from "../slices/playlistSongs";


export const store = configureStore({
    reducer: {
       auth: authReducer,
       message: messageReducer,
       songs: songsReducer,
       videos: videosReducer,
       playlist: playlistReducer,
       playlistSongs: playlistSongsReducer,
       [songApi.reducerPath]: songApi.reducer,
       [getArtist.reducerPath]: getArtist.reducer,
       [videoApi.reducerPath]: videoApi.reducer,
       [playlistApi.reducerPath]: playlistApi.reducer,
       [playlistSongsApi.reducerPath]: playlistSongsApi.reducer,

       
       
    },
    middleware: (getDefaultMiddleware) =>
        getDefaultMiddleware({
            serializableCheck: false,
        }).concat(songApi.middleware, 
                  getArtist.middleware,
                  videoApi.middleware,
                  playlistApi.middleware,
                  playlistSongsApi.middleware),
    devTools: true,
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch