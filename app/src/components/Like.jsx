import React, { useEffect, useState } from "react";
import { HiHeart } from "react-icons/hi";
import { motion } from "framer-motion";
import {
  useDeleteLikeMutation,
  useGetLikesQuery,
  usePostLikeMutation,
} from "../redux/services/like";
import { ToastContainer, toast } from "react-toastify";
import { HiOutlineHeart } from "react-icons/hi";
import { useLiveQuery } from "dexie-react-hooks";
import { db } from "../db/db";

const Like = ({ user, song }) => {
  const [post, { isFetching: fetchingPost }] = usePostLikeMutation();
  const [unlike, { isFetching: fetchingDelete }] = useDeleteLikeMutation();
  const [showErr, setShowErr] = useState(false);
  const [indexedLikes, setIndexedLikes] = useState(
    useLiveQuery(() => db.likes.toArray())
  );

  const { data: likes, isLoading, isFetching, refetch } = useGetLikesQuery();

  async function addLikes({ user, song }) {
    var id;
    try {
      if (user && song) {
        id = await db.likes.add({
          user,
          song,
        });
      } else {
        console.log(" provide user and song field of student ");
      }
    } catch (error) {
      toast.error(`Failed to add ${name}: ${error}`);
    }
  }

  const isLiked = likes
    ? likes?.data.find(
        (like) =>
          like?.attributes?.user?.data?.id === user &&
          like?.attributes?.song?.data.id === song
      )
    : indexedLikes?.find(
        (like) =>
          like?.attributes?.user?.data?.id === 1 &&
          like?.attributes?.song?.data.id === song
      );

  const send = async () => {
    const data = { user, song };

    if (!user) toast.error("Vous devez être connecter");
    try {
      await post(JSON.stringify({ data })).then((rep) => {
        console.log("like rep", rep);
        toast.success("👍🏾");
      });

      refetch();
    } catch (error) {}
  };

  const remove = async () => {
    console.warn("isLiked", isLiked, user);
    if (isLiked)
      try {
        s;
        await unlike(isLiked.id).then((rep) => {
          console.log("la reponse", rep);
          refetch();
        });
      } catch (error) {}
  };

  useEffect(() => {
    if (likes?.data.length > 0) {
      if (!indexedLikes || indexedLikes.length === 0) {
        likes?.data.map((item) => {
          let data = { user, song };
          addLikes(data);
        });
      }
    }
  }, [likes]);

  return (
    <>
      <motion.button
        whileHover={{ scale: 1.4 }}
        whileTap={{ scale: 0.9 }}
        onClick={isLiked ? () => remove() : () => send()}
        className="flex-col text-orange-500  p-1">
        {isLiked ? <HiHeart /> : <HiOutlineHeart />}
      </motion.button>
    </>
  );
};

export default Like;
