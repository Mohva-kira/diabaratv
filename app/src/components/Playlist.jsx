import React, { useEffect, useState } from "react";
import { HiPlusCircle, HiOutlinePlusCircle } from "react-icons/hi";
import { motion } from "framer-motion";
import {
  useGetPlaylistsQuery,
  usePostPlaylistMutation,
} from "../redux/services/playlist";
import Modal from "./Modal";
import { useSelector } from "react-redux";

const Playlist = () => {
  const [postPlaylist] = usePostPlaylistMutation();
  const [isActive, setIsActive] = useState(false);
  const [name, setName] = useState();
  const stateUser = useSelector((state) => state.auth);
  const storageUser =
    localStorage.getItem("auth") && JSON.parse(localStorage.getItem("auth"));

  const [realData, setRealData] = useState()

  const { data, isLoading, isFetching, isError, refetch } =
    useGetPlaylistsQuery();

  const user = stateUser?.auth?.user ? stateUser : storageUser;
  console.log("user", user);
  const isAdded = false;

  const treatData = () => {

    let result = []
    data?.data.map(item => {
      if (item?.attributes.user?.data?.id === user.auth.user.id) {
        result.push(item)
      }
    })
    setRealData(result)
    return
  }

  const send = async (e) => {
    e.preventDefault();

    const data = { name, user: user?.auth?.user?.id };

    const makeServerRequest = new Promise((resolve, reject) => {
      try {
        postPlaylist(JSON.stringify({ data })).then((rep) => {
          console.log("reponse", rep);
          refetch();
        });

        resolve("Promesse ténue");
      } catch (error) {
        reject("Promesse non tenue");
      }
    });

    makeServerRequest.then((result) => {
      console.log("playlist", result);
      refetch();
    });
  };
  useEffect(() => {
    refetch();
    treatData()
  }, [data]);
  return (
    <>
      {user && (
        <>
          <motion.button
            whileHover={{ scale: 1.4 }}
            whileTap={{ scale: 0.9 }}
            onClick={() => setIsActive(!isActive)}
            className="flex-col text-orange-500  p-1"
          >
            {isAdded ? <HiPlusCircle /> : <HiOutlinePlusCircle />}
          </motion.button>

          <Modal
            name={name}
            data={realData}
            setName={setName}
            send={send}
            isActive={isActive}
            setIsActive={setIsActive}
          />
        </>
      )}
    </>
  );
};

export default Playlist;
