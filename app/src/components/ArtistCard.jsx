import { useNavigate } from "react-router-dom";


const ArtistCard = ({track}) => {

  const navigate = useNavigate()
  return(  
  <div className="flex flex-col w-[250px] p-4 bg-white/5 bg-opaicity-80 
  backdrop-blur-sm animate-slideup rounded-lg cursor-pointer"
  onClick={() => navigate(`/artists/${track?.id}`)}
  > 
    <img src={`http://localhost:1337${track?.attributes.image.data[0].attributes.url}`} alt="artist" className="w-full h-56 rounded-lg"/>
    <p className="mt-4 font-semibold text-lg text-white truncate"> {track.attributes.name}  </p>
  </div>)

};

export default ArtistCard;
