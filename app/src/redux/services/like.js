/* React-specific entry point that automatically generates
   hooks corresponding to the defined endpoints */
   import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

   const API_URL = "https://api.diabara.tv/api";
   
   export const likeApi = createApi({
     reducerPath: "likeAPI",
     baseQuery: fetchBaseQuery({ baseUrl: API_URL,
      prepareHeaders: (headers, { getState }) => {
        const token = getState().auth.auth.token ? getState().auth.auth.token  : JSON.parse(localStorage.getItem('auth')).jwt ;
        console.log('tok', token)
        if (token) {
          headers.set("authorization", `Bearer ${token}`);
        }
    
        headers.set("Content-Type", "Application/json");
        headers.set("Accept", "Application/json");
    
        return headers;
      },
    }),
    
     endpoints: (builder) => ({
       // The `getPosts` endpoint is a "query" operation that returns data
       getLikes: builder.query({
         // The URL for the request is '/fakeApi/posts'
         query: () => "/likes?populate=*",
       }),
       postLike: builder.mutation({
        // The URL for the request is '/fakeApi/posts'
        query: (data) => ({
            url: "/likes",
            method: 'POST',
            body: data

    
    }),



      }),


      deleteLike: builder.mutation({
        // The URL for the request is '/fakeApi/posts'
        query: (id) => ({
            url: "/likes/" +id,
            method: 'DELETE'
            

    
    }),
      }),



     }),
   });
   
   export const {
     useGetLikesQuery,
     usePostLikeMutation,
     useDeleteLikeMutation
    
   } = likeApi;
   