import React from 'react'
import {  HiPlusCircle, HiOutlinePlusCircle } from "react-icons/hi";
import { motion } from 'framer-motion';

const Playlist = () => {

  const isAdded = false
  return (
    <motion.button
    whileHover={{ scale: 1.1 }}
    whileTap={{ scale: 0.9 }}
     className="flex-col text-orange-500  p-1">
   {isAdded ?  <HiPlusCircle /> : <HiOutlinePlusCircle />} 
    </motion.button>
  )
}

export default Playlist