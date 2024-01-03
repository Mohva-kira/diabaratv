import  SongBar  from './SongBar'
import SongCard from './SongCard';

const RelatedSongs = ({data, isPlaying, activeSong, handlePauseClick, handlePlayClick, artistId}) => (

  <div className='flex flex-col'>
    
    <h1 className='font-bold text-3xl text-white'>Related Songs:</h1>
    <div className="mt-6 flex flex-wrap sm:justify-start justify-center gap-8">
      {
        data?.map((song, i) => (
          <SongCard 
          key={song.id}
          song={song}
          i={i}
          artistId={artistId}
          isPlaying={isPlaying}
          activeSong={activeSong}
          handlePauseClick={handlePauseClick}
          handlePlayClick={handlePlayClick}
          />
          ))
      }
    </div>
  </div>
);

export default RelatedSongs;
