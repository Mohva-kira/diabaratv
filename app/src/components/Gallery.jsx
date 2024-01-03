import React from "react";

const Gallery = ({data, artist}) => {

    console.log('name', artist)
  
  return (
    <div class="bg-white mt-6 dark:bg-[#232351] rounded-2xl  h-full py-6 sm:py-8 lg:py-12">
      <div class="mx-auto max-w-screen-2xl px-4 md:px-8">
        <div class="mb-4 flex items-center justify-between gap-8 sm:mb-8 md:mb-12">
          <div class="flex items-center gap-12">
            <h2 class="text-2xl font-bold text-gray-800 lg:text-3xl dark:text-white">
              Gallerie de {artist.data.attributes.name}
            </h2>

            <p class="hidden max-w-screen-sm text-gray-500 dark:text-gray-300 md:block">
             Retrouvez toutes mes photos ici !!!
            </p>
          </div>

          <a
            href="#"
            class="inline-block rounded-lg border bg-white dark:bg-gray-700 dark:border-none px-4 py-2 text-center text-sm font-semibold text-gray-500 dark:text-gray-200 outline-none ring-indigo-300 transition duration-100 hover:bg-gray-100 focus-visible:ring active:bg-gray-200 md:px-8 md:py-3 md:text-base"
          >
            Plus
          </a>
        </div>

        <div class="grid grid-cols-2 gap-4 sm:grid-cols-3 md:gap-6 xl:gap-8">
          {data ?
            data?.map((item) => (
              <a
                href="#"
                class="group relative flex h-48 items-end overflow-hidden rounded-lg bg-gray-100 shadow-lg md:h-80"
              >
                <img
                  src={`http://localhost:1337${item.attributes?.url}`}
                  loading="lazy"
                  alt="Photo by Minh Pham"
                  class="absolute inset-0 h-full w-full object-cover object-center transition duration-200 group-hover:scale-110"
                />

                <div class="pointer-events-none absolute inset-0 bg-gradient-to-t from-gray-800 via-transparent to-transparent opacity-50"></div>

                <span class="relative ml-4 mb-3 inline-block text-sm text-white md:ml-5 md:text-lg">
                  VR
                </span>
              </a>
            )) : <p> La gallerie n'est pas disponible </p>
        
        }


        </div>
      </div>
    </div>
  );
};

export default Gallery;
