import { useSelector } from "react-redux";
import { Route, Routes } from "react-router-dom";

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
  AddSong
} from "./pages";

const App = () => {
  const { activeSong } = useSelector((state) => state.player);
//  console.log('api', process.env.REACT_APP_API_URL) 
  return (
    <div className="relative flex">
      <Sidebar /> 
      <div className="flex-1 flex flex-col bg-gradient-to-br from-black to-[#121286]">
      <Header/>
       

        <div className="px-6 h-[calc(100vh-72px)] overflow-y-scroll hide-scrollbar flex xl:flex-row flex-col-reverse">
          <div className="flex-1 h-fit pb-40">
            <Routes>
              <Route path="/" element={<Discover />} />
              <Route path="/login" element={<Auth />} />
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
            <TopPlay />
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
