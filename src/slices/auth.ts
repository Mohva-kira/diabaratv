import {createSlice, createAsyncThunk} from "@reduxjs/toolkit";
import {setMessage} from "./message"
import AuthServices from "../features/auth.service"
const user = JSON.parse(localStorage.getItem("user")!);

export const register = createAsyncThunk  (
    "auth/register",
    async ({firstName, lastName, email, password} : any, thunkAPI)  => {

        try {
            const response = await AuthServices.register(firstName, lastName, email, password);
            thunkAPI.dispatch(setMessage(response.data.message));
            return response.data
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
);

export const login = createAsyncThunk(
    "auth/login",
    async ({username, password} : any, thunkApi) => {
        try {
            const data = await AuthServices.login(username, password);
            return {user: data};
        }catch (error: any) {

            const message =
                (error.response &&
                error.response.data &&
                error.response.data.message) ||
                error.message ||
                error.toString();
            thunkApi.dispatch(setMessage(message));

            return thunkApi.rejectWithValue(error.response)

        }
    }
);

export const logout = createAsyncThunk(
    "auth/logout",
    async () => {await AuthServices.logout()}
);

const initialState = user
    ? {isLoggedIn: true, user}
    : {isLoggedIn: false, user: null};

const authSlice = createSlice({
    name: "auth",
    initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder.addCase(register.fulfilled, (state, action) => {
            state.isLoggedIn = false;
        });
        builder.addCase(register.rejected, (state, action) => {
            state.isLoggedIn = false;
        });
        builder.addCase(login.fulfilled, (state, action) =>  {
            state.isLoggedIn = true;
            state.user = action.payload.user;
        });
        builder.addCase(login.rejected, (state, action) => {
            state.isLoggedIn = false;
            state.user = null;
        });
        builder.addCase(logout.fulfilled, (state, action) => {
            state.isLoggedIn= false;
            state.user = null;
        });

    }
});

const {reducer} = authSlice;
export default reducer