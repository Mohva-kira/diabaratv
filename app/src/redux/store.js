import { configureStore } from "@reduxjs/toolkit";

import playerReducer from "./features/playerSlice";
import { songsApi } from "./services/songsApi";
import songsReducer from "./features/songsSlice"
import { authApi } from "./services/auth";
import authReducer from "./features/auth/authSlice";
import { artistsApi } from "./services/artistApi";

export const store = configureStore({
  reducer: {
    player: playerReducer,
    auth: authReducer,
    songs: songsReducer,
    [songsApi.reducerPath]: songsApi.reducer,
    [authApi.reducerPath]: authApi.reducer,
    [artistsApi.reducerPath]: artistsApi.reducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(
      songsApi.middleware,
      authApi.middleware,
      artistsApi.middleware
    ),
  devTools: true,
});
("");
