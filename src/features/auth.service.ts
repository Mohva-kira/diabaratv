import axios from "axios";

const API_URL = "http://localhost/diabaraServer/api/";

class AuthService {
    login(username: string, password: string ){
        return axios
            .post(API_URL + "login.php", {
                username,
                password
            })
            .then(response => {
                if (response.data.accessToken){
                    localStorage.setItem("user", JSON.stringify(response.data))
                }
                return response.data;
            })
    }

    logout() {
        localStorage.removeItem("user");
    }

    register(firstName: string, lastName: string,  email: string, password: string){
        return axios.post(API_URL + "register.php", {
            firstName,
            lastName,
            email,
            password
        })
    }

    getCurrentUser(){
        const userStr = localStorage.getItem("user");
        if (userStr) return JSON.parse(userStr);
        return null;
    }
}

export default new AuthService();