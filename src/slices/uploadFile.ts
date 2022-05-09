import { createSlice, createAsyncThunk} from "@reduxjs/toolkit";
import {setMessage} from "./message"
import uploadServices from "../features/upload.service";

const initialState = {};

export const uploadFile = createAsyncThunk(
    "upload/File",
    async (formData: any, thunkAPI) => {
        try {
            const response = await uploadServices.uploadFile(formData);
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