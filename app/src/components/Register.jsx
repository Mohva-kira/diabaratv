import React from "react";
import { Link, useNavigate } from "react-router-dom";
import { useState } from "react";
import { useDispatch } from "react-redux";
import { setCredentials } from "../redux/features/auth/authSlice";
import { motion } from "framer-motion";
import sing from "../assets/sing.gif";
import {
  isPossiblePhoneNumber,
  isValidPhoneNumber,
  validatePhoneNumberLength,
} from "libphonenumber-js";
import { toast } from "react-toastify";

const Register = ({
  switchPage,
  switchModeHandler,
  isFetchingRegister,
  register,
  isVisited,
  setIsVisited,
}) => {
  const [phone, setPhone] = useState(null);

  const [password, setPassword] = useState(null);
  const [secondPassword, setSecontPassword] = useState(null);
  const [confirmPassword, setConfirmPassword] = useState(false);
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const send = async () => {
    setIsVisited(!isVisited);
    if (!isValidPhoneNumber(phone, "MLI")) {
      toast.error("Entrez un numero valide");
      return;
    }

    if (password === secondPassword) {
      setConfirmPassword(true);
    } else {
      setConfirmPassword(false),
        toast.error("Les mots de passe doivent être identiques");
      return;
    }

    const data = { username: phone, password, email: phone + "@diabara.tv" };
    console.log("data", data);
    await register(JSON.stringify(data))
      .then((rep) => {
        console.log("reponse", rep);
        localStorage.setItem("auth", JSON.stringify(rep));
        localStorage.setItem("phone", phone);
        dispatch(setCredentials(rep?.data));
        toast.success("Compte créer avec succès");
        switchPage();
      })
      .catch((err) => {
        console.log("error", err);
        toast.error("Une erreur est survenur veuillez réessayer", err);
      });
  };

  return (
    <section className="min-h-screen flex flex-col items-center justify-center  p-4">
      <div className="h-full w-full max-w-6xl">
        <div className="flex h-full sm:flex-col lg:flex-row flex-wrap items-center justify-center lg:justify-between">
          {/* Section de l'image */}
          <div className="shrink-1 mb-12 grow-0 basis-auto md:mb-0 md:w-9/12 lg:w-6/12 xl:w-6/12">
            <img
              src="https://tecdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
              className="w-full"
              alt="Sample image"
            />
          </div>

          {/* Section du formulaire */}
          <div className="mb-12 md:mb-0 md:w-8/12 lg:w-5/12 xl:w-5/12 text-center bg-white p-6 rounded-lg shadow-lg">
            <p className="text-gray-800 mb-4 text-3xl font-semibold">
              Inscription
            </p>
            <form className=" bg-slate-400 p-4 rounded-lg space-y-4">
              {/* Input du numéro de téléphone */}
              <div className="relative mb-6">
                <input
                  type="text"
                  className="peer block w-full rounded-md border border-gray-300 p-2 outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="+22377888888"
                  maxLength="16"
                  minLength="8"
                  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                  required
                  onChange={(e) => setPhone(e.target.value)}
                />
              </div>

              {/* Input du mot de passe */}
              <div className="relative mb-6">
                <input
                  type="password"
                  className="peer block w-full rounded-md border border-gray-300 p-2 outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="Mot de passe"
                  onChange={(e) => setPassword(e.target.value)}
                />
              </div>

              {/* Input confirmation du mot de passe */}
              <div className="relative mb-6">
                <input
                  type="password"
                  className="peer block w-full rounded-md border border-gray-300 p-2 outline-none focus:ring-2 focus:ring-blue-500"
                  placeholder="Confirmer le mot de passe"
                  onChange={(e) => setSecontPassword(e.target.value)}
                />
              </div>

              {/* Bouton S'inscrire */}
              <div className="text-center">
                <motion.button
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                  type="button"
                  className="w-full rounded-lg bg-orange-600 px-6 py-3 text-white font-bold shadow-md hover:bg-orange-700"
                  onClick={() => send()}>
                  S'inscrire
                </motion.button>
              </div>

              {/* Redirection vers la page de connexion */}
              <p className="text-sm mt-4">
                Vous avez déjà un compte?{" "}
                <motion.button
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                  onClick={() => switchPage()}
                  className="text-orange-600 hover:underline">
                  Se connecter
                </motion.button>
              </p>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Register;
