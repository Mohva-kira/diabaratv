import { useParams } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { DetailsHeader, Error, Loader, RelatedSongs } from "../components";


import { setActiveSong, playPause } from "../redux/features/playerSlice";
import { useGetArtistDetailsQuery, useGetSongDetailsQuery, useGetSongRelatedQuery } from "../redux/services/songsApi";
import { useEffect } from "react";

const SongDetails = () => {
    const dispatch = useDispatch()
    const { songid } = useParams()
    const { activeSong, isPlaying } = useSelector(state => state.player)
    const { data: songData, isFetching: isFetchingSongDetails, isSuccess: isSuccess, isError: error } = useGetSongDetailsQuery(songid)
    // const { data: relatedSong, isFetching: isFetchingRelatedSong, error} = useGetSongRelatedQuery(isSuccess? songData?.data?.id : "")
    const  songs = isSuccess && songData.data.length > 0 ? songData : localStorage.getItem('songs') && JSON.parse(localStorage.getItem('songs'))
    const { data: artistData, isFetching: isFetchingArtistDetails, isError: errorArtiste } = useGetArtistDetailsQuery(songData?.data?.attributes?.artist?.data.id )
    

   const relatedSong = songs?.data?.filter((song) => song.attributes.artist.data.id === Number(songData?.data?.attributes.artist?.data.id) )

    const handlePauseClick = () => {
        dispatch(playPause(false))
      }
    
      const handlePlayClick = (song, i) => {
          dispatch(setActiveSong({ song, i}))
          dispatch(playPause(true))
      }
      
      useEffect(() => {
        
      }, [songData])

    if(isFetchingSongDetails ) return <Loader title="Searching song details" />
    if (error) return <Error />

    return (
        <div className="flex flex-col">
            {console.log('sond', songData)}
            {console.log('art', artistData)}
            <DetailsHeader artiste_id="" songData={songData} artistData={artistData} />

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
             data={relatedSong}
             isPlaying={isPlaying}
             activeSong={activeSong}
            
             handlePauseClick={handlePauseClick}
             handlePlayClick={handlePlayClick}
            />
        </div>
    )
};

export default SongDetails;
