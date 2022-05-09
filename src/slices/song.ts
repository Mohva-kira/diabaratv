import { createAsyncThunk} from "@reduxjs/toolkit";
import {setMessage} from "./message"
import SongServices from "../features/songs.service"
import userService from "../features/user.service";


const initialState = {
    isContent: false
};
const API_URL='http://localhost/diabaraServer/';


export const createSong = createAsyncThunk(
    "songs/creation",
    async ({title, artiste_id, year, duration, url, image} : any, thunkAPI) => {
        try {
            const response = await SongServices.createSong(title, artiste_id, year, duration, url, image);
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


