import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  songs: [],
  genre: [],
};

const SongsSlice = createSlice({
  name: 'Songs',
  initialState,
  reducers: {
    setSongs: (state, action) => {
      console.error('active', action.payload)
      localStorage.setItem('songs', JSON.stringify(action.payload))
      state.songs = action.payload;
     
      
    },

    setGenre: (state, action) => {
        console.error('active', action.payload)
        state.genre = action.payload;
       
        
      },
  },
});

export const { setSongs, setGenre } = SongsSlice.actions;

export default SongsSlice.reducer;
