import { configureStore } from "@reduxjs/toolkit";

import authReducer from "../slices/auth"
import messageReducer from "../slices/message"
import userService from "../features/user.service";
import { songApi } from "../features/songs.service"
import { getArtist } from "../features/artist.service";
import songsReducer from "../slices/song"
export const store = configureStore({
    reducer: {
       auth: authReducer,
       message: messageReducer,
       [songApi.reducerPath]: songApi.reducer,
        [getArtist.reducerPath]: getArtist.reducer,
        songs: songsReducer,
    },
    middleware: (getDefaultMiddleware) =>
        getDefaultMiddleware({
            serializableCheck: false,
        }).concat(songApi.middleware, getArtist.middleware),
    devTools: true,
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch