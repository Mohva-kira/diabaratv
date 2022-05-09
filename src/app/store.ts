import { configureStore } from "@reduxjs/toolkit";
import authReducer from "../slices/auth"
import messageReducer from "../slices/message"
import userService from "../features/user.service";
import { songApi } from "../features/songs.service"

export const store = configureStore({
    reducer: {
       auth: authReducer,
       message: messageReducer,
       [songApi.reducerPath]: songApi.reducer,
    },
    middleware: (getDefaultMiddleware) =>
        getDefaultMiddleware({
            thunk: {
                extraArgument: userService.getPublicContent,
            },
            serializableCheck: false,
        }),
    devTools: true,
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch