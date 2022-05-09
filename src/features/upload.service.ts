import axios from "axios";

const API_URL = "http://localhost/diabaraServer/api/";

const uploadFile = (formData: any) => {
    return axios.post(API_URL + "upload_file.php", formData,
        { headers: { "Content-Type": "multipart/form-data" },
    });
}

const uploadServices = {uploadFile}

export default uploadServices;