import React, { useState } from "react";
import { useAddArtistMutation } from "../redux/services/artistApi";
import { motion } from "framer-motion";
import { useRegisterMutation } from "../redux/services/auth";
import { useNavigate } from "react-router-dom";
const Adhesion = () => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [image, setImage] = useState();
  const [password, setPassword] = useState();
  const [password2, setPassword2] = useState();
  const [date_naissance, setDate_naissance] = useState();
  const [adresse, setAdresse] = useState();
  const [genre, setGenre] = useState();
  const [phone, setPhone] = useState();
  const [addArtist] = useAddArtistMutation();
  const [register, { isFetchingRegister }] = useRegisterMutation();
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      let data = { username: phone, email, password };
      const user = await register(JSON.stringify(data)).then((rep) =>
        console.log("artiste enregistré", rep)
      );
      const response = await addArtist(
        JSON.stringify({ data: [name, email, adresse, genre, date_naissance] })
      ).then((rep) => console.log("artiste enregistré", rep));
      alert(response.data.message);
    } catch (error) {
      console.error(error);
      alert("Error submitting request");
    }
  };

  return (
    <section className="h-screen">
      <div className="h-full">
        <div className="g-6 flex h-full flex-wrap items-center justify-center lg:justify-between">
          <div className="shrink-1 mb-12 grow-0 basis-auto md:mb-0 md:w-9/12 md:shrink-0 lg:w-6/12 xl:w-6/12">
            <img
              src="https://sdk.bitmoji.com/render/panel/20042967-99547979581_5-s5-v1.png?transparent=1&palette=1&scale=2"
              className="w-full "
              alt="Sample image"
            />
          </div>

          <div className="mb-12 md:mb-0 md:w-8/12 lg:w-5/12 xl:w-5/12">
            <p className="text-slate-200 text-center mb-4 mr-4 text-3xl">
              Inscription artiste
            </p>
            <form
              className="bg-slate-400 p-2 rounded-lg"
              onSubmit={handleSubmit}>
              <div className="flex flex-row items-center justify-center lg:justify-center">
                <button
                  type="button"
                  data-te-ripple-init
                  data-te-ripple-color="light"
                  className="inlne-block mx-1 h-9 w-9 rounded-full bg-primary uppercase leading-normal text-white shadow-[0_4px_9px_-4px_#3b71ca] transition duration-150 ease-in-out hover:bg-primary-600 hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:bg-primary-600 focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:outline-none focus:ring-0 active:bg-primary-700 active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] dark:shadow-[0_4px_9px_-4px_rgba(59,113,202,0.5)] dark:hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)]">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="mx-auto h-3.5 w-3.5"
                    fill="currentColor"
                    viewBox="0 0 24 24">
                    <path d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z" />
                  </svg>
                </button>

                <button
                  type="button"
                  data-te-ripple-init
                  data-te-ripple-color="light"
                  className="inlne-block mx-1 h-9 w-9 rounded-full bg-primary uppercase leading-normal text-white shadow-[0_4px_9px_-4px_#3b71ca] transition duration-150 ease-in-out hover:bg-primary-600 hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:bg-primary-600 focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:outline-none focus:ring-0 active:bg-primary-700 active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] dark:shadow-[0_4px_9px_-4px_rgba(59,113,202,0.5)] dark:hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)]">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="mx-auto h-3.5 w-3.5"
                    fill="currentColor"
                    viewBox="0 0 24 24">
                    <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z" />
                  </svg>
                </button>

                <button
                  type="button"
                  data-te-ripple-init
                  data-te-ripple-color="light"
                  className="inlne-block mx-1 h-9 w-9 rounded-full bg-primary uppercase leading-normal text-white shadow-[0_4px_9px_-4px_#3b71ca] transition duration-150 ease-in-out hover:bg-primary-600 hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:bg-primary-600 focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] focus:outline-none focus:ring-0 active:bg-primary-700 active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.3),0_4px_18px_0_rgba(59,113,202,0.2)] dark:shadow-[0_4px_9px_-4px_rgba(59,113,202,0.5)] dark:hover:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:focus:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)] dark:active:shadow-[0_8px_9px_-4px_rgba(59,113,202,0.2),0_4px_18px_0_rgba(59,113,202,0.1)]">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="mx-auto h-3.5 w-3.5"
                    fill="currentColor"
                    viewBox="0 0 24 24">
                    <path d="M4.98 3.5c0 1.381-1.11 2.5-2.48 2.5s-2.48-1.119-2.48-2.5c0-1.38 1.11-2.5 2.48-2.5s2.48 1.12 2.48 2.5zm.02 4.5h-5v16h5v-16zm7.982 0h-4.968v16h4.969v-8.399c0-4.67 6.029-5.052 6.029 0v8.399h4.988v-10.131c0-7.88-8.922-7.593-11.018-3.714v-2.155z" />
                  </svg>
                </button>
              </div>

              <div className="my-4 flex items-center before:mt-0.5 before:flex-1 before:border-t before:border-neutral-300 after:mt-0.5 after:flex-1 after:border-t after:border-neutral-300">
                <p className="mx-4 mb-0 text-center font-semibold dark:text-white">
                  Or
                </p>
              </div>

              <div className="relative mb-6" data-te-input-wrapper-init>
                <input
                  type="text"
                  className="peer block min-h-[auto] bg-slate-200 w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="exampleFormControlInput2"
                  placeholder="Nom"
                  onChange={(e) => setName(e.target.value)}
                />
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] peer-focus:scale-[0.8] ${
                    name && "scale-[0.8] text-primary -translate-y-[2.15rem]"
                  } peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[1.15rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Nom d'artiste
                </label>
              </div>
              <div className="relative mb-6" data-te-input-wrapper-init>
                <input
                  type="email"
                  className="peer block bg-slate-200 min-h-[auto] w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="exampleFormControlInput2"
                  placeholder="Nom"
                  onChange={(e) => setEmail(e.target.value)}
                />
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] peer-focus:scale-[0.8] ${
                    name && "scale-[0.8] text-primary -translate-y-[2.15rem]"
                  } peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[1.15rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Email
                </label>
              </div>
              <div className="relative mb-6" data-te-input-wrapper-init>
                <input
                  type="text"
                  className="peer block bg-slate-200 min-h-[auto] w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="exampleFormControlInput2"
                  placeholder="Nom"
                  onChange={(e) => setPhone(e.target.value)}
                />
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] peer-focus:scale-[0.8] ${
                    name && "scale-[0.8] text-primary -translate-y-[2.15rem]"
                  } peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[1.15rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Téléphone
                </label>
              </div>
              <div className="relative mb-6" data-te-input-wrapper-init>
                <input
                  type="date"
                  className="peer text-slate-600  bg-slate-200 block min-h-[auto] w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-slate-600 dark:placeholder:text-slate-600 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="exampleFormControlInput2"
                  placeholder="Nom"
                  onChange={(e) => setDate_naissance(e.target.value)}
                />
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] peer-focus:scale-[0.8] scale-[0.8] text-primary -translate-y-[2.15rem] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[1.15rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Date de naissance
                </label>
              </div>

              <div className="relative mb-6" data-te-input-wrapper-init>
                <input
                  type="password"
                  className="peer bg-slate-200 block min-h-[auto] w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="password"
                  placeholder="Nom"
                  onChange={(e) => setPassword(e.target.value)}
                />
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] peer-focus:scale-[0.8] scale-[0.8] text-primary -translate-y-[2.15rem] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[1.15rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Mot de passe
                </label>
              </div>

              <div className="relative mb-12" data-te-input-wrapper-init>
                <input
                  type="password"
                  className="peer bg-slate-200 block min-h-[auto] w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="password2"
                  placeholder="Nom"
                  onChange={(e) => setPassword2(e.target.value)}
                />
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] peer-focus:scale-[0.8] scale-[0.8] text-primary -translate-y-[2.15rem] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[1.15rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Mot de passe
                </label>
              </div>
              <div className="relative mb-6" data-te-input-wrapper-init>
                <input
                  type="text"
                  className="peer bg-slate-200 block min-h-[auto] w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="adresse"
                  placeholder="adresse"
                  onChange={(e) => setAdresse(e.target.value)}
                />
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] peer-focus:scale-[0.8] ${
                    name && "scale-[0.8] text-primary -translate-y-[2.15rem]"
                  } peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[1.15rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Adresse
                </label>
              </div>

              <div className="relative mb-6" data-te-input-wrapper-init>
                <select
                  type="date"
                  className="peer bg-slate-200 text-slate-600 block min-h-[auto] w-full rounded border-0 bg-transparent px-3 py-[0.32rem] leading-[2.15] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-slate-600 dark:placeholder:text-slate-600 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                  id="exampleFormControlInput2"
                  placeholder="Nom"
                  onChange={(e) => setDate_naissance(e.target.value)}
                  multiple>
                  <option value="mandingue">Mandingue</option>
                  <option value="mandingue">Griot</option>
                  <option value="mandingue">Rap</option>
                  <option value="mandingue">RnB</option>
                  <option value="mandingue">Reggae</option>
                  <option value="mandingue">Mandingue</option>
                </select>
                <label
                  htmlFor="exampleFormControlInput2"
                  className={`pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[2.15] text-slate-600 transition-all duration-200 ease-out peer-focus:-translate-y-[2.15rem] scale-[0.8] text-primary -translate-y-[2.15rem] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[2.15rem] peer-data-[te-input-state-active]:scale-[1.8] motion-reduce:transition-none dark:text-slate-600 dark:peer-focus:text-primary`}>
                  Genre
                </label>
              </div>
              <div className="flex w-full items-center justify-center">
                <motion.button
                  whileHover={{ scale: 1.1 }}
                  whileTap={{ scale: 0.9 }}
                  type="submit"
                  // onClick={(e) => handleSubmit(e)}
                  className="ml-3 text-white bg-orange-600 rounded-lg p-1 top-2 transition duration-150 ease-in-out hover:text-danger-600 focus:text-danger-600 active:text-danger-700">
                  S'inscrire
                </motion.button>

                <motion.button
                  whileHover={{ scale: 1.1 }}
                  whileTap={{ scale: 0.9 }}
                  onClick={() => navigate("/login")}
                  className="ml-3 text-white bg-orange-600 rounded-lg p-1 top-2 transition duration-150 ease-in-out hover:text-danger-600 focus:text-danger-600 active:text-danger-700">
                  Se connecter
                </motion.button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Adhesion;
