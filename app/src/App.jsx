import { useSelector } from "react-redux";
import { Route, Routes, useLocation, useParams } from "react-router-dom";
import ReactGA from 'react-ga';
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
import Favourites from "./pages/Favourites";
import ReactPWAInstallProvider, { useReactPWAInstall } from "react-pwa-install";


const App = () => {

  ReactGA.initialize('G-2EWMYHKZ3E');
  const { pwaInstall, supported, isInstalled } = useReactPWAInstall();

  const handleClick = () => {
    pwaInstall({
      title: "Install Web App",
      logo: myLogo,
      features: (
        <ul>
          <li>Cool feature 1</li>
          <li>Cool feature 2</li>
          <li>Even cooler feature</li>
          <li>Works offline</li>
        </ul>
      ),
      description: "This is a very good app that does a lot of useful stuff. ",
    })
      .then(() => alert("App installed successfully or instructions for install shown"))
      .catch(() => alert("User opted out from installing"));
  };
 
  const { activeSong } = useSelector((state) => state.player);
//  console.log('api', process.env.REACT_APP_API_URL) 
  let url = useLocation()
  const isCompleted = window.location
  const TRACKING_ID = "G-YQKY9V1351"; // OUR_TRACKING_ID
  ReactGA.initialize(TRACKING_ID);


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
  
  // alert(window.screen.width)

  useEffect(() => {
    ReactGA.pageview(window.location.pathname + window.location.search);
  }, []);

 
  return (
    <div className="relative flex">
      <Sidebar /> 
      <ToastContainer />
      <div className="flex-1 flex flex-col bg-gradient-to-br from-black to-[#121286]">
      <Header/>
   

        <div className={`px-6 h-[calc(100vh-80px)] ${window.screen.width <= 465 ? 'h-[calc(100vh-140px)]' : ''}  overflow-y-scroll hide-scrollbar flex xl:flex-row flex-col-reverse`}>
          <div className="flex-1 h-fit pb-40">
            <ReactPWAInstallProvider enableLogging>
            <Routes>
              <Route path="/" element={<Discover />} />
              <Route path="/login" element={<Auth />} />
              <Route path="/blog/features" element={<Features />} />
              <Route path="/songs/add" element={<AddSong />} />
              <Route path="/top-artists" element={<TopArtists />} />
              <Route path="/top-charts" element={<TopCharts />} />
              <Route path="/around-you" element={<AroundYou />} />
              
              <Route element={<RequireAuth />}>
                <Route path="/favourites" element={<Favourites />} />
                <Route path="/artists/:id" element={<ArtistDetails />} />
              </Route>

              <Route path="/songs/:songid" element={<SongDetails />} />
              <Route path="/search/:searchTerm" element={<Search />} />
            </Routes>
            </ReactPWAInstallProvider>
          </div>
          <div className="xl:sticky relative top-0 h-fit">
             {url.pathname.includes('/blog') || url.pathname.includes('/login') ? null :  <TopPlay />}
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
