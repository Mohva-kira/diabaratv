// db.js
import Dexie from 'dexie';
export const db = new Dexie('database');  // database is database name with 1 version 
db.version(1).stores({
  songs: '++id, name , audio, artist, date_de_sortie, cover, genre, pays, ville, album', // Primary key and indexed props
  likes: '++id, user, song ',
  streams: '++id, user, song, start, end, uuid',
  playlist: '++id, name, user',
  playlist_song: '++id, playlist, song, position',
  category: '++id, name',
  artist: '++id, name, image, date_naissance, adresse, pays, ville, email, biographie, genres',
  album: '++id, name, artist, songs, year, description, image',
  images: '++id, file'
  
});