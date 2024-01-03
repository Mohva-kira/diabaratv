import { useParams } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { DetailsHeader, Error, Loader, RelatedSongs } from "../components";


import { setActiveSong, playPause } from "../redux/features/playerSlice";
import { useGetSongDetailsQuery, useGetSongRelatedQuery } from "../redux/services/songsApi";

const SongDetails = () => {
    const dispatch = useDispatch()
    const { songid } = useParams()
    const { activeSong, isPlaying } = useSelector(state => state.player)
    const { data: songData, isFetching: isFetchingSongDetails } = useGetSongDetailsQuery(songid)
    const { data: relatedSong, isFetching: isFetchingRelatedSong, error} = useGetSongRelatedQuery(songData? songData?.data[0]?.artiste_id : "")

    const handlePauseClick = () => {
        dispatch(playPause(false))
      }
    
      const handlePlayClick = (song, i) => {
          dispatch(setActiveSong({ song, i}))
          dispatch(playPause(true))
      }
    

    if(isFetchingSongDetails || isFetchingRelatedSong) return <Loader title="Searching song details" />
    if (error) return <Error />

    return (
        <div className="flex flex-col">
            {console.log(songData)}
            <DetailsHeader artiste_id="" songData={songData} />

            <div className="mb-10">
                <h2 className="text-white text-3xl font-bold" >Lyrics:</h2>
                <div className="mt-5">
                    {songData?.lyrics ?

                        songData?.lyrics.text.map((line, i) => (
                            <p className="text-gray-400  text-base my-1" key={i}>line</p>
                        )) : <p className="text-gray-400  text-base my-1">
                            Sorry, no lyrics found!
                        </p>

                    }
                </div>
            </div>

            <RelatedSongs 
             data={relatedSong.data}
             isPlaying={isPlaying}
             activeSong={activeSong}
             handlePauseClick={handlePauseClick}
             handlePlayClick={handlePlayClick}
            />
        </div>
    )
};

export default SongDetails;
