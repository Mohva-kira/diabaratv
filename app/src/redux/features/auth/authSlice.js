import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  auth: {},

};





const authSlice = createSlice({
    name: 'auth',
    initialState,
    reducers: {
        setCredentials: (state, action) => {
            console.log(action.payload)
            const {user, jwt} = action.payload
            
            state.auth.user = user
            state.auth.token = jwt

            localStorage.setItem('token', jwt)
            
        },
        logOut: (state, action) => {
            state.auth = {}
            localStorage.clear()
        }
    
    }
})

export const { setCredentials, logOut} = authSlice.actions
export default authSlice.reducer
// localStorage.clear()
const auth = localStorage.getItem('auth') ? JSON.parse(localStorage.getItem('auth')) : null

console.log('auth', auth)
export const selectCurrentUser = (state) => state?.auth ? state.auth.user : auth?.user
export const selectCurrentToken = (state) => state?.auth ? state.auth.jwt : auth?.jwt