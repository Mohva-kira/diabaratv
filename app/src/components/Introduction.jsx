import { motion } from "framer-motion";
import React, { useState } from "react";
import welcome from "../assets/welcome.png";
import intro from "../assets/intro.jpg"
import { useGetGenresQuery } from "../redux/services/genres";
import Loader from "./Loader";
import {
  useGetArtistsByGenreQuery,
  useGetArtistsQuery,
} from "../redux/services/artistApi";
import Register from "./Register";
import { useRegisterMutation } from "../redux/services/auth";
import { useGetVisitorsByUUIDQuery } from "../redux/services/visitor";

const Introduction = ({
  isVisited,
  setIsVisited,
  firstVisitData,
  addVisitor,
}) => {
  const words = "Bienvenue !!!".split(" ");
  const prefTitle = "Vos préferences".split(" ");
  const { data, isLoading, isFetching, isSuccess } = useGetGenresQuery();
  const {
    data: artistData,
    isLoading: artistIsLoading,
    isFetching: artistIsFetching,
    isSuccess: artistIsSuccess,
  } = useGetArtistsByGenreQuery();

  const API_FILE_URL = import.meta.env.VITE_API_FILE_URL;

  const { userAgent } = window.navigator;
  const { platform } = window.navigator;
  const randomString =
    Math.random().toString(20).substring(2, 14) +
    Math.random().toString(20).substring(2, 14);

  const [selected, setSelected] = useState(0);
  const [prefs, setPrefs] = useState([]);
  const [prefsArtists, setPrefsArtists] = useState([]);

  const [registerAccount, { isFetchingRegister }] = useRegisterMutation();
  const handleSelectPrefs = (item) => {
    setPrefs((prevPref) => {
      if (prevPref.includes(item)) {
        // Retire l'élément s'il est déjà présent
        return prevPref.filter((pref) => pref !== item);
      } else {
        // Ajoute l'élément s'il n'est pas présent
        return [...prevPref, item];
      }
    });
  };

  const handleSelectArtists = (item) => {
    setPrefsArtists((prefsArtists) => {
      if (prefsArtists.includes(item)) {
        // Retire l'élément s'il est déjà présent
        return prefsArtists.filter((pref) => pref !== item);
      } else {
        // Ajoute l'élément s'il n'est pas présent
        return [...prefsArtists, item];
      }
    });
  };

  // Variants for Container of words.
  const container = {
    hidden: { opacity: 0 },
    visible: (i = 1) => ({
      opacity: 1,
      transition: {
        staggerChildren: 0.12,
        delayChildren: 0.04 * i,
        duration: 0.1,
      },
    }),
  };

  // Variants for each word.

  const child = {
    visible: {
      opacity: 1,
      x: 0,
      transition: {
        type: "spring",
        damping: 12,
        stiffness: 100,
      },
    },
    hidden: {
      opacity: 0,
      x: 20,
      transition: {
        type: "spring",
        damping: 12,
        stiffness: 100,
      },
    },
  };

  const preferences = (
    <div className="w-full h-full ">
      <div className="w-full flex justify-center items-center p-2">
        <motion.div
          style={{
            overflow: "hidden",
            display: "flex",
            fontSize: "2rem",
          }}
          variants={container}
          initial="hidden"
          animate="visible">
          {prefTitle.map((word, index) => (
            <motion.span
              variants={child}
              style={{ marginRight: "5px" }}
              key={index}>
              {word}
            </motion.span>
          ))}
        </motion.div>
      </div>

      <div className="w-full h-full mt-10">
        <div className="w-full flex flex-col flex-wrap gap-10 h-[35vh] mt-10 ">
          <div className="w-full  flex items-center    animate-loop-scroll ">
            {isFetching ? (
              <Loader title="Chargement des genres...." />
            ) : (
              data?.data.slice(0, 9).map((item) => (
                <div
                  onClick={() => handleSelectPrefs(item)}
                  style={{ backgroundColor: item.attributes.color }}
                  className={`p-2 ${
                    prefs.find(
                      (pref) => pref.attributes.name === item.attributes.name
                    )
                      ? "text-white shadow-orange-500 shadow-xl"
                      : "text-black shadow-md"
                  } cursor-pointer  flex flex-grow items-stretch p-4 align-baseline   w-full  font-bold    rounded-2xl h-fit `}>
                  {" "}
                  {item.attributes.name}{" "}
                </div>
              ))
            )}
          </div>
          <div className="w-full flex justify-around animate-loop-scroll-invert space-x-5">
            {isFetching ? (
              <Loader title="Chargement des genres...." />
            ) : (
              data?.data.slice(9, 19).map((item, index) => (
                <p
                  onClick={() => handleSelectPrefs(item)}
                  key={index}
                  style={{ backgroundColor: item.attributes.color }}
                  className={`p-2 ${
                    prefs.find(
                      (pref) => pref.attributes.name === item.attributes.name
                    )
                      ? "text-white shadow-orange-500 shadow-xl"
                      : "text-black shadow-md"
                  } cursor-pointer flex flex-grow items-stretch p-4 align-baseline   w-full  font-bold    rounded-2xl h-fit `}>
                  {" "}
                  {item.attributes.name}{" "}
                </p>
              ))
            )}
          </div>

          <div className="w-full flex justify-around">
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
            <span className=" bg-amber-300 p-2 rounded-2xl h-fit ">
              {" "}
              Rumba{" "}
            </span>
          </div>
        </div>
      </div>
      <div className="w-full flex flex-col gap-10 h-[35vh] p-2">
        <div className="flex justify-between animate-loop-scroll">
          {artistIsFetching ? (
            <Loader title="Chargement des genres...." />
          ) : (
            artistData?.data.slice(0, 9).map((item) => (
              <div
                onClick={() => handleSelectArtists(item)}
                className={`${
                  prefsArtists.find(
                    (prefsArtists) =>
                      prefsArtists.attributes.name === item.attributes.name
                  )
                    ? "text-sky-900 shadow-orange-500 shadow-xl"
                    : "text-black shadow-md"
                } "flex flex-col relative z-0  items-center m-4 w-32 h-32 font-bold  rounded-2xl p-3 space-x-5"`}>
                <div
                  style={{
                    backgroundImage: `url(${
                      API_FILE_URL +
                      item.attributes.image.data[0].attributes?.url
                    })`,
                    filter: "blur(50px)",
                  }}
                  className="w-full h-full bg-cover scale-100 -z-50  absolute"></div>
                <img
                  className="w-16 h-16 z-50 object-cover rounded-full mr-4"
                  src={
                    API_FILE_URL + item.attributes.image.data[0].attributes?.url
                  }
                  alt=""
                />
                <p className="flex-grow truncate">{item.attributes.name}</p>
              </div>
            ))
          )}
        </div>
      </div>
    </div>
  );

  const register = (
    <div className="w-full h-fit flex justify-center items-center p-2">
      <div className="w-full">
        <motion.div
          style={{
            overflow: "hidden",
            display: "flex",
            fontSize: "2rem",
          }}
          variants={container}
          initial="hidden"
          animate="visible">
          {words.map((word, index) => (
            <motion.span
              variants={child}
              style={{ marginRight: "5px" }}
              key={index}>
              {word}
            </motion.span>
          ))}
        </motion.div>
      </div>

      <div className="w-full h-full">
        <div className="w-full  h-full">
          {
            <Register
              register={registerAccount}
              isVisited={isVisited}
              setIsVisited={setIsVisited}
              addVisitor={addVisitor}
            />
          }
        </div>
      </div>
    </div>
  );

  const welcomeSlide = (
    <div className="w-full h-full" 
    
    >
      
      <div className="w-full z-50 flex justify-center items-center p-2">
        <motion.div
          style={{
            overflow: "hidden",
            display: "flex",
            fontSize: "2rem",
          }}
          variants={container}
          initial="hidden"
          animate="visible">
          {words.map((word, index) => (
            <motion.span
              variants={child}
              style={{ marginRight: "5px", zIndex: 100 }}
              key={index}>
              <h2 className="text-2xl font-bold text-orange-600">{word}</h2>
            </motion.span>
          ))}
        </motion.div>
      </div>

      <div className="w-full h-full z-50" >
      
        <div className="w-full h-[75vh]">
          <img className="w-full h-full object-contain ezà" src={intro} />
        </div>
      </div>
    </div>
  );

  const contents = [welcomeSlide, preferences, register];
  const handleNext = () => {
    setSelected((prevSelected) => (prevSelected + 1) % contents.length);
  };

  // Gérer le bouton "Passer" (exemple : fermer la modale ou passer au contenu suivant)
  const handleSkip = () => {
    // Si tu veux faire une action spécifique ici (par exemple fermer la modale)
    addVisitor(firstVisitData).then((res) => {

    });
    setIsVisited(!isVisited);
  };

  return (
    <div
      className="relative z-10"
      aria-labelledby="modal-title"
      role="dialog"
      aria-modal="true">
      <div
        className="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
        aria-hidden="true"></div>

      <div className="fixed inset-0 z-10 w-screen  overflow-y-auto">
        <div className="flex w-full min-h-screen items-end justify-center p-4 text-center sm:items-center sm:p-0">
          <div className="relative w-fit transform overflow-hidden rounded-2xl p-1  bg-blue-900 text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
            <div className="bg-white w-full flex flex-col justify-around rounded-b-0  rounded-2xl p-2 sm:p-6 sm:pb-4">
              <div className="sm:flex sm:items-start mb-10  w-full">
                {contents[selected]}
              </div>
              <div className="bg-whithe  px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
                <button
                  onClick={() => {
                    selected !== 2 ? handleNext() : registerAccount(),
                      setIsVisited(!visited);
                  }} // Changer de contenu au clic
                  type="button"
                  className={` ${
                    selected !== 2 ? "block" : "hidden"
                  } "inline-flex w-full justify-center shadow-lg rounded-md bg-orange-600 px-3 py-2 text-sm font-semibold text-white  hover:bg-red-500 sm:ml-3 sm:w-auto"`}>
                  Suivant
                </button>
                <button
                  onClick={handleSkip} // Action "Passer"
                  type="button"
                  className="mt-3 inline-flex w-full justify-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-lg hover:scale-50 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 sm:mt-0 sm:w-auto">
                  Passer
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Introduction;
