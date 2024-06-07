import { useNavigate } from "react-router-dom";


const ArtistCard = ({track}) => {
const {onLine} = window.navigator

  const navigate = useNavigate()
  return(  
  <div className="flex flex-col w-[250px] p-4 bg-white/5 bg-opaicity-80 
  backdrop-blur-sm animate-slideup rounded-lg cursor-pointer"
  onClick={() => navigate(`/artists/${track?.id}`)}
  > 
    <img src={onLine ? `https://api.diabara.tv${track?.attributes.image.data[0].attributes.url}` : track?.image} alt="artist" className="w-full h-56 rounded-lg"/>
    <p className="mt-4 font-semibold text-lg text-white truncate"> {onLine ? track.attributes.name : track.name}  </p>
  </div>)

};

export default ArtistCard;
