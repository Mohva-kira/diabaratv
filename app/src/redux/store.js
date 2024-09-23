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
import  { streamsApi } from "./services/streams";
import streamsReducer from "./services/streams";

import downloadsReducer, { downloadsApi } from "./services/download";
import albumsReducer, { albumsApi } from "./services/albums";
import genresReducer, { genresApi } from "./services/genres";
import visitorsReducer, { visitorApi } from "./services/visitor";


export const store = configureStore({
  reducer: {
    player: playerReducer,
    auth: authReducer,
    songs: songsReducer,
    streams: streamsReducer,
    downloads: downloadsReducer,
    albums: albumsReducer,
    genres: genresReducer,
    visitors: visitorsReducer,
    [songsApi.reducerPath]: songsApi.reducer,
    [authApi.reducerPath]: authApi.reducer,
    [artistsApi.reducerPath]: artistsApi.reducer,
    [likeApi.reducerPath]: likeApi.reducer,
    [playlistApi.reducerPath]: playlistApi.reducer,
    [playlistSongApi.reducerPath]: playlistSongApi.reducer,
    [streamsApi.reducerPath]: streamsApi.reducer,
    [downloadsApi.reducerPath]: downloadsApi.reducer,
    [albumsApi.reducerPath]: albumsApi.reducer,
    [genresApi.reducerPath]: genresApi.reducer,
    [visitorApi.reducerPath]: visitorApi.reducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(
      songsApi.middleware,
      authApi.middleware,
      artistsApi.middleware,
      likeApi.middleware,
      playlistApi.middleware,
      playlistSongApi.middleware,
      streamsApi.middleware,
      downloadsApi.middleware,
      albumsApi.middleware,
      genresApi.middleware,
      visitorApi.middleware,
    ),
  devTools: true,
});
("");
