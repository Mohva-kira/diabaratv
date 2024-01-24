import { useSelector } from "react-redux";
import { Route, Routes, useLocation, useParams } from "react-router-dom";

import {
  Searchbar,
  Sidebar,
  MusicPlayer,
  TopPlay,
  RequireAuth,
  Header
} from "./components";
import {
  ArtistDetails,
  TopArtists,
  AroundYou,
  Discover,
  Search,
  SongDetails,
  TopCharts,
  Auth,
  AddSong,
  Features
} from "./pages";
import { useEffect } from "react";
import { ToastContainer, toast } from 'react-toastify';

import 'react-toastify/dist/ReactToastify.css';

const App = () => {
  const { activeSong } = useSelector((state) => state.player);
//  console.log('api', process.env.REACT_APP_API_URL) 
  let url = useLocation()
  const isCompleted = window.location

  useEffect(() => {
    console.log('aa', url)
    console.log('isCompleted', isCompleted)
    const onPageLoad = () => {
      console.log('page loaded');
    url = window.location.href 

      // do something else
    };
    // Check if the page has already loaded
    if (document.readyState === 'complete') {
      onPageLoad();
    } else {
      window.addEventListener('load', onPageLoad, false);
      // Remove the event listener when component unmounts
      return () => window.removeEventListener('load', onPageLoad);
    }
  }, [])

 
  return (
    <div className="relative flex">
      <Sidebar /> 
      <ToastContainer />
      <div className="flex-1 flex flex-col bg-gradient-to-br from-black to-[#121286]">
      <Header/>
      

        <div className="px-6 h-[calc(100vh-80px)] overflow-y-scroll hide-scrollbar flex xl:flex-row flex-col-reverse">
          <div className="flex-1 h-fit pb-40">
            <Routes>
              <Route path="/" element={<Discover />} />
              <Route path="/login" element={<Auth />} />
              <Route path="/blog/features" element={<Features />} />
              <Route path="/songs/add" element={<AddSong />} />
              <Route path="/top-artists" element={<TopArtists />} />
              <Route path="/top-charts" element={<TopCharts />} />
              <Route path="/around-you" element={<AroundYou />} />
              <Route element={<RequireAuth />}>
                <Route path="/artists/:id" element={<ArtistDetails />} />
              </Route>

              <Route path="/songs/:songid" element={<SongDetails />} />
              <Route path="/search/:searchTerm" element={<Search />} />
            </Routes>
          </div>
          <div className="xl:sticky relative top-0 h-fit">
             {url.pathname.includes('/blog') ? null :  <TopPlay />}
          </div>
        </div>
      </div>

      {activeSong?.attributes?.name && (
        <div className="absolute h-28 bottom-0 left-0 right-0 flex animate-slideup bg-gradient-to-br from-white/10 to-[#2a2a80] backdrop-blur-lg rounded-t-3xl z-10">
          <MusicPlayer />
        </div>
      )}
    </div>
  );
};

export default App;
