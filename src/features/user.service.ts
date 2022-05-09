import axios from "axios"
import authHeader from "./auth-header"

const API_URL = "http://localhost/diabaraServer/api/";
const getPublicContent = () => {
    return axios.get(API_URL + "all.php");
};

const getUserBoard = () =>  {
    // @ts-ignore
    return axios.get(API_URL + "user", { headers: authHeader() });
};

const getModeratorBoard = () => {
    // @ts-ignore
    return axios.get(API_URL + "mod", {headers: authHeader() })
};

const getAdminBoard = () => {
    // @ts-ignore
    return axios.get(API_URL + "admin", {headers: authHeader()})
};

const userService = {getUserBoard, getModeratorBoard, getAdminBoard, getPublicContent}

export default userService;
