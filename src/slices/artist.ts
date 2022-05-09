import { createAsyncThunk} from "@reduxjs/toolkit";
import {setMessage} from "./message"
import ArtistService from "../features/artist.service";
import SongServices from "../features/songs.service";

export const createArtist = createAsyncThunk(
    "songs/creation",
    async ({name, location, image, create_at, status, created_user} : any, thunkAPI) => {
        try {
            const response = await ArtistService.createArtist(name, location, image, create_at, status, created_user);
            thunkAPI.dispatch(setMessage(response.data))
            return response.data;
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