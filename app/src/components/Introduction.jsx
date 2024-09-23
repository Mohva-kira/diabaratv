import { motion } from "framer-motion";
import React, { useState } from "react";
import welcome from "../assets/welcome.png";
import { useGetGenresQuery } from "../redux/services/genres";
import Loader from "./Loader";
import {
  useGetArtistsByGenreQuery,
  useGetArtistsQuery,
} from "../redux/services/artistApi";
import Register from "./Register";
import { useRegisterMutation } from "../redux/services/auth";
import { useGetVisitorsByUUIDQuery } from "../redux/services/visitor";

const Introduction = ({isVisited, setIsVisited}) => {
  const words = "Bienvenue sur DiabaraTv".split(" ");
  const prefTitle = "Vos préferences".split(" ");
  const { data, isLoading, isFetching, isSuccess } = useGetGenresQuery();
  const {
    data: artistData,
    isLoading: artistIsLoading,
    isFetching: artistIsFetching,
    isSuccess: artistIsSuccess,
  } = useGetArtistsByGenreQuery();



  const { userAgent } = window.navigator;
  const { platform } = window.navigator;
  const randomString = Math.random().toString(20).substring(2, 14)
    + Math.random().toString(20).substring(2, 14);



  const [selected, setSelected] = useState(0)
  const [prefs, setPrefs] = useState([])
  const [prefsArtists, setPrefsArtists] = useState([])

  const [registerAccount, { isFetchingRegister }] = useRegisterMutation();
  const handleSelectPrefs = (item) => {
    setPrefs((prevPref) => {
      if (prevPref.includes(item)) {
        // Retire l'élément s'il est déjà présent
        return prevPref.filter(pref => pref !== item);
      } else {
        // Ajoute l'élément s'il n'est pas présent
        return [...prevPref, item];
      }
    });
  };

  const handleSelectArtists= (item) => {
    setPrefsArtists((prefsArtists) => {
      if (prefsArtists.includes(item)) {
        // Retire l'élément s'il est déjà présent
        return prefsArtists.filter(pref => pref !== item);
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
          <div className="w-full  flex items-center text-center   animate-loop-scroll ">
            {isFetching ? (
              <Loader title="Chargement des genres...." />
            ) : (
              data.data.slice(0, 9).map((item) => (
                <div
                  onClick={() => handleSelectPrefs(item)}
                  style={{ backgroundColor: item.attributes.color }}
                  className={`p-2 ${prefs.find(pref => pref.attributes.name === item.attributes.name) ? 'text-white shadow-orange-500 shadow-xl' : 'text-black shadow-md'} cursor-pointer flex flex-grow items-stretch m-4 align-baseline   w-full  font-bold    rounded-2xl h-fit `}>
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
              data.data.slice(9, 19).map((item) => (
                <p
                  onClick={() => handleSelectPrefs(item)}

                  style={{ backgroundColor: item.attributes.color }}
                  className={`p-2 ${prefs.find(pref => pref.attributes.name === item.attributes.name) ? 'text-white shadow-orange-500 shadow-xl' : 'text-black shadow-md'} cursor-pointer flex flex-grow items-stretch m-4 align-baseline   w-full  font-bold    rounded-2xl h-fit `}>
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
      artistData.data.slice(0, 9).map((item) => (
        <div 
        onClick={() => handleSelectArtists(item)}
        className={`${prefsArtists.find(prefsArtists => prefsArtists.attributes.name === item.attributes.name) ? 'text-sky-900 shadow-orange-500 shadow-xl' : 'text-black shadow-md'} "flex flex-col items-center m-2 w-32  font-bold  rounded-2xl p-5"`}>
          <img
            className="w-16 h-16 object-cover rounded-full mr-4"
            src={
              "https://api.diabara.tv" +
              item.attributes.image.data[0].attributes?.url
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
    <div className="w-full h-fit">
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
         { <Register register={registerAccount}  isVisited={isVisited} setIsVisited={setIsVisited} />}
        </div>
      </div>
    </div>
  );

  const welcomeSlide = (
    <div className="w-full h-full">
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
        <div className="w-full h-[75vh]">
          <img className="w-full h-full" src={welcome} />
        </div>
      </div>
    </div>
  );

  const contents = [
    welcomeSlide,
    preferences,
    register
  ]
  const handleNext = () => {
    setSelected((prevSelected) => (prevSelected + 1) % contents.length);
  };


   // Gérer le bouton "Passer" (exemple : fermer la modale ou passer au contenu suivant)
   const handleSkip = () => {
    // Si tu veux faire une action spécifique ici (par exemple fermer la modale)
    console.log('Passer l\'action, contenu ignoré');
  };

  console.log('prefs', prefs)
  return (
    <div
      class="relative z-10"
      aria-labelledby="modal-title"
      role="dialog"
      aria-modal="true">
      <div
        class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
        aria-hidden="true"></div>

      <div class="fixed inset-0 z-10 w-screen  overflow-y-auto">
        <div class="flex w-full min-h-screen items-end justify-center p-4 text-center sm:items-center sm:p-0">
          <div class="relative w-fit transform overflow-hidden rounded-2xl p-1  bg-blue-900 text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
            <div class="bg-white w-full flex flex-col justify-around rounded-b-0  rounded-2xl p-2 sm:p-6 sm:pb-4">
              <div class="sm:flex sm:items-start mb-10  w-full">{contents[selected]}</div>
              <div class="bg-whithe  px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
              <button
              onClick={() =>{ selected !== 2 ? handleNext() : registerAccount(), setIsVisited(!visited)}} // Changer de contenu au clic
                type="button"
                className={` ${selected !== 2 ? 'block' : 'hidden'} "inline-flex w-full justify-center shadow-lg rounded-md bg-orange-600 px-3 py-2 text-sm font-semibold text-white  hover:bg-red-500 sm:ml-3 sm:w-auto"`}>
                Suivant
              </button>
              <button
              onClick={handleSkip} // Action "Passer"
                type="button"
                class="mt-3 inline-flex w-full justify-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-lg hover:scale-50 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 sm:mt-0 sm:w-auto">
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
