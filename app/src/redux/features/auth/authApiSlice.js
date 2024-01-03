import { authApi } from "../../services/auth"

export const authApiSlice = authApi.injectEndpoints({
    endpoints: builder => ({
        login: builder.mutation({
            query: credentials => ({
                url: '/auth',
                body: JSON.stringify({...credentials}),
                method: 'POST'
            })
         }),
         addUser:  builder.mutation({
            query: credentials => ({
                url: '/users',
                body: { ...credentials},
                method: 'POST'
            })
         }),

    })
})
export const { useAddUserMutation} = authApiSlice