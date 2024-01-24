import React, { useState } from 'react'
import { HiHeart } from "react-icons/hi";
import { motion } from 'framer-motion';
import { useGetLikesQuery, usePostLikeMutation } from '../redux/services/like';
import { ToastContainer, toast } from 'react-toastify';
import { HiOutlineHeart } from 'react-icons/hi';
const Like = ({user, song}) => {
    const [post, {isFetching: fetchingPost} ] = usePostLikeMutation()
    const [showErr, setShowErr] = useState(false)

    const {data: likes, isLoading, isFetching, refetch} = useGetLikesQuery()

    const send = async () => {
        const data = {user, song }
        console.log('like data', data)
        if(!user) toast.error('Vous devez être connecter')
        try {
            await post(JSON.stringify({data})).then(rep => console.log('like rep', rep))
            refetch()
        } catch (error) {
            
        }
    }


    const isLiked = likes?.data.find(like => like?.attributes?.user?.data?.id === 1 && like?.attributes?.song?.data.id === song)
     
    
  return (
            <>
                {console.log('like Data', likes)}
            <motion.button
            whileHover={{ scale: 1.4 }}
            whileTap={{ scale: 0.9 }}
            onClick={() => send()}
             className="flex-col text-orange-500  p-1">

        
            {isLiked ? <HiHeart /> : <HiOutlineHeart />}    
           
            </motion.button>
            </>
  )
}

export default Like