import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  user: null,
  token: null,
};


const authSlice = createSlice({
    name: 'auth',
    initialState,
    reducers: {
        setCredentials: (state, action) => {
            console.log(action.payload)
            const {user, jwt} = action.payload

            state.user = user
            state.token = jwt
            console.log('state', state.auth)
        },
        logOut: (state, action) => {
            state.user = null
            state.token = null
        }
    
    }
})

export const { setCredentials, logOut} = authSlice.actions
export default authSlice.reducer

export const selectCurrentUser = (state) => state.auth.user ? state.auth.user : JSON.parse(localStorage.getItem('auth'))
export const selectCurrentToken = (state) => state.auth.token