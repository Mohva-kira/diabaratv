import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";
import { setCredentials, logOut } from "../features/auth/authSlice";

const apiUrl = "https://api.diabara.tv/api/auth";
// const apiUrl = process.env.REACT_APP_API_URL
console.log('api url', apiUrl)
const baseQuery = fetchBaseQuery({
  baseUrl: apiUrl,

  prepareHeaders: (headers, { getState }) => {
    const token = getState().auth.token;

    if (token) {
      headers.set("authorization", `Bearer ${token}`);
    }

    headers.set("Content-Type", "Application/json");
    headers.set("Accept", "Application/json");

    return headers;
  },
});

const baseQueryWithReauth = async (args, api, extraOptions) => {
  let result = await baseQuery(args, api, extraOptions);

  // if(result) {
  //     console.log('sending refresh token')

  //     const refreshResult = await baseQuery('/refresh', api, extraOptions)
  //     console.log(refreshResult)

  //     if(refreshResult?.data){
  //         const user = api.getState().auth.user
  //         api.dispatch(setCredentials({ ...refreshResult.data, user}))

  //         result = await baseQuery(args, api, extraOptions)
  //     }else {
  //         api.dispatch(logOut())
  //     }

  //     return result
  // }

  return result;
};

export const authApi = createApi({
  reducerPath: "Auth",
  baseQuery: baseQueryWithReauth,
  endpoints: (builder) => ({
    login: builder.mutation({
      // The URL for the request is '/fakeApi/posts'
      query: (data) => ({ url: "/local", body: data, method: "POST" }),
    }),

    register: builder.mutation({

      query: (data) => ({ url: "/local/register", body: data, method: "POST" }),

    })
  }),

});


export const {useLoginMutation, useRegisterMutation} = authApi