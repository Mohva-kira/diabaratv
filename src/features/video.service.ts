import axios from "axios";

const API_URL = "http://localhost/diabaraServer/api/";

const createVideo = (title: any, artiste_id: any, url: any, image: any, createdAt: any, createdBy: any) => {
    return axios.post(API_URL + "create_video.php", {
        title,
        artiste_id,
        url,
        image,
        createdAt,
        createdBy
    });
   };

   const VideoServices = {createVideo};
   export default VideoServices;