import { Link } from "react-router-dom";



const DetailsHeader = ({ artiste_id, artistData, songData }) => {

  return (
    <div className="relative w-full flex  flex-col">
      {console.log('artist data', artistData)}
      <div className="w-full bg-gradient-to-l from-transparent to-black sm:h-48 h-28">
        <div className="absolute inset-0 flex items-center">
          <img src={`https://api.diabara.tv${artistData?.data.attributes.image.data[0].attributes.url}`} alt="" className="sm:w-48 w-28 sm:h-48 h-28 rounded-full object-cover shadow-xl shadow-black " />
          <div className="ml-5">
            <p className="font-bold sm:text-3xl text-xl text-white" >{artistData?.data?.attributes.name}</p>
            {
              !artiste_id && (
              <Link>
                <p className="text-base text-gray-400 mt-2">{songData?.data?.attributes.name}</p>
              </Link>)
            }

            <p className="text-base text-gray-400 mt-2">
              {artiste_id
              ? `Genre: ${artistData?.data?.attributes.genres.data[0]?.attributes.name.charAt(0).toUpperCase() + artistData?.data?.attributes.genres.data[0]?.attributes.name.slice(1)}` //artist?.genreNames[0]
              : 'Rap' // songData?.data.genre  '

              }
            </p>
          </div>
        </div>


      </div>
          <div className="w-full sm:h-44 h-24" />
    </div>
  )
};

export default DetailsHeader;
