import { useParams } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { DetailsHeader, Error, Loader, RelatedSongs, SongCard } from "../components";


import { setActiveSong, playPause } from "../redux/features/playerSlice";
import { useGetArtistDetailsQuery, useGetSongDetailsQuery, useGetSongRelatedQuery } from "../redux/services/songsApi";
import { useEffect } from "react";
import { Helmet } from "react-helmet";

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
            <Helmet>
        <meta name="description" content={"Description of your page"} />
        <meta property="og:title" content={songData?.attributes?.name} />
        <meta
          property="og:description"
          content={`Ecouter la musique de ${songData?.data.attributes?.artist?.data?.attributes.name} - ${songData?.data.attributes.name}`}
        />
        <meta
          property="og:image"
          content={`https://diabara.tv${songData?.data.attributes?.cover?.data[0].attributes.url}`}
        />
        <meta
          property="og:url"
          content={`https://diabara.tcv/songs/${songData?.data.id}`}
        />
        <meta property="og:type" content="website" />
        <meta property="twitter:card" content="Diabara.tv" />
      </Helmet>
            <DetailsHeader artiste_id="" songData={songData} artistData={artistData} />


            <div className="flex items-center justify-center w-full">
                <SongCard 
                detail={'w-full'}
                key={songData?.data.id}
                song={songData.data}
                
                isPlaying={isPlaying}
                activeSong={activeSong}
                data={relatedSong}
                />
            </div>

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
