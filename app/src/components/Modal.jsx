import React, { useState } from "react";

const Modal = ({ isActive, setIsActive, setName, name, send, data }) => {
  return (
    <div
      id="crypto-modal"
      tabindex="-1"
      aria-hidden="true"
      class={`${
        isActive ? "block" : "hidden"
      }  overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full`}
    >
      <div class="relative p-1  bg-[#0a197100] shadow-orange-400  rounded-3xl w-full max-w-md max-h-full">
        <div class="relative bg-transparent rounded-lg shadow dark:bg-transparent">
          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
            <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
              Playlist
            </h3>
            <button
              type="button"
              class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm h-8 w-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
              data-modal-toggle="crypto-modal"
              onClick={() => setIsActive(!isActive)}
            >
              <svg
                class="w-3 h-3"
                aria-hidden="true"
                fill="none"
                viewBox="0 0 14 14"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"
                />
              </svg>
              <span class="sr-only">Close modal</span>
            </button>
          </div>
          <div class="p-4 md:p-5">
            <p class="text-sm font-normal text-gray-500 dark:text-gray-400">
              Selectionnez la playlist
            </p>
            <ul class="my-4 space-y-3">
              {data?.slice(0,5).map((item) => (
                <li>
                  <a
                    href="#"
                    class="flex items-center p-3 text-xs font-bold text-gray-900 rounded-lg bg-gray-50 hover:bg-gray-100 group hover:shadow dark:bg-gray-600 dark:hover:bg-gray-500 dark:text-white"
                  >
                    <span class="flex-1 ms-3  whitespace-nowrap"> {item.attributes.name} </span>
                    {/* <span class="inline-flex items-center justify-center px-2 py-0.5 ms-3 text-xs font-medium text-gray-500 bg-gray-200 rounded dark:bg-gray-700 dark:text-gray-400">
                    Popular
                  </span> */}
                  </a>
                </li>
              ))}
            </ul>
            <div>
              <form class="max-w-sm mx-auto flex flex-wrap gap-3">
                <input
                  type="text"
                  name="floating_email"
                  id="floating_email"
                  class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                  placeholder=" "
                  s
                  required
                  onChange={(e) => setName(e.target.value)}
                />
                <label
                  for="floating_email"
                  class="peer-focus:font-medium absolute text-sm text-white dark:text-white duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                >
                  Nom de la playlist
                </label>

                <button
                  onClick={(e) => send(e)}
                  disabled={!name}
                  className="bg-orange-500 text-sm text-white font-semibold rounded-full p-2 shadow-lg shadow-white "
                >
                  {" "}
                  Ajouter{" "}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Modal;
