import React from 'react'
import ReactDOM from 'react-dom/client'
import {BrowserRouter, Route, Routes} from "react-router-dom";
import App from './App'
import './index.css'
import { store } from "./app/store"
import { Provider } from "react-redux"
import Home from "./components/Home";
import Register from "./components/Register";
import Login from "./components/Login";
import AddSong from "./components/form/AddSong";
import AddArtist from "./components/form/AddArtist";

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
      <Provider store={store}>
      <BrowserRouter>

          <Routes>
              <Route path="/" element={<App />} >
                  <Route path="home" element={<Home />} />
                  <Route path="register" element={<Register />} />
                  <Route path="login" element={<Login />} />
                  <Route path="add_song" element={<AddSong />} />
                  <Route path="add_artist" element={<AddArtist />} />
              </Route>
          </Routes>

      </BrowserRouter>
      </Provider>
  </React.StrictMode>
)
