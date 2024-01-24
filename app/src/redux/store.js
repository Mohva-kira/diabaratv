import { configureStore } from "@reduxjs/toolkit";

import playerReducer from "./features/playerSlice";
import { songsApi } from "./services/songsApi";
import songsReducer from "./features/songsSlice"
import { authApi } from "./services/auth";
import authReducer from "./features/auth/authSlice";
import { artistsApi } from "./services/artistApi";
import { likeApi } from "./services/like";
import { playlistApi } from "./services/playlist";
import { playlistSongApi } from "./services/playlistSong";


export const store = configureStore({
  reducer: {
    player: playerReducer,
    auth: authReducer,
    songs: songsReducer,
    [songsApi.reducerPath]: songsApi.reducer,
    [authApi.reducerPath]: authApi.reducer,
    [artistsApi.reducerPath]: artistsApi.reducer,
    [likeApi.reducerPath]: likeApi.reducer,
    [playlistApi.reducerPath]: playlistApi.reducer,
    [playlistSongApi.reducerPath]: playlistSongApi.reducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(
      songsApi.middleware,
      authApi.middleware,
      artistsApi.middleware,
      likeApi.middleware,
      playlistApi.middleware,
      playlistSongApi.middleware,
    ),
  devTools: true,
});
("");
