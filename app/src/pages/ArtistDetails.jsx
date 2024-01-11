import { useParams } from "react-router-dom";
import { useSelector } from "react-redux";
import { DetailsHeader, Error, Loader, RelatedSongs,  Gallery } from "../components";

import { selectCurrentToken, selectCurrentUser } from "../redux/features/auth/authSlice";
import { Link } from "react-router-dom";

import { useGetArtistDetailsQuery } from "../redux/services/songsApi";


const ArtistDetails = () => {
  const user = useSelector(selectCurrentUser)
  const token = useSelector(selectCurrentToken)
  
  const { activeSong, isPlaying } = useSelector(state => state.player)
  const data = useSelector(state => state.songs)
  const  songs = data.length > 0 ? data : localStorage.getItem('songs') && JSON.parse(localStorage.getItem('songs'))
  const { id: artistId } = useParams()
  const { data: artistData, isFetching: isFetchingArtistDetails, isError: error } = useGetArtistDetailsQuery(artistId)
  // const { data: relatedSong, isFetching: isFetchingRelatedSong, error} = useGetSongRelatedQuery(artistId)
  console.log('artist ID', artistId)
  console.log('songs', songs)
  const relatedSong = songs?.data?.filter((song) => song.attributes.artist.data.id === Number(artistId) )
  console.log('artiste data', artistData)


  if (isFetchingArtistDetails ) return <Loader title="Loading artist details" />
  if (error) return <Error />

  return (
    <div className="flex flex-col">
      {console.log('related songs', relatedSong)}
      <DetailsHeader artiste_id={artistId} artistData={artistData} songData={relatedSong}/>

      {artistData?.data.attributes.Biographie && 

        <p className="text-slate-300 text-xl font-light m-7 text-justify ">
            {artistData?.data.attributes.Biographie}
        </p>
          
      }

      
        <RelatedSongs
        data={relatedSong}
        isPlaying={isPlaying}
        activeSong={activeSong}
        artistId={artistId}
      />
        

        {artistData?.data.attributes.image?.data &&
          <Gallery data={artistData?.data.attributes.image?.data} artist={artistData} />
        }
        
      
    </div>
  )
};

export default ArtistDetails;
