import React from "react";
import { features } from "../constant";

const Blog = () => {
  return (
    <div>
      <div class="container my-24 mx-auto md:px-6">
        <section class="mb-32">
          {features.map((item) => (
            <>
              <div class="flex flex-wrap mb-32">
                <div class="mb-12 w-full shrink-0 grow-0 basis-auto lg:mb-0 lg:w-5/12">
                  <div class="flex lg:py-12">
                    <img
                      src="https://mdbcdn.b-cdn.net/img/new/standard/people/058.jpg"
                      class="z-[10] w-full rounded-lg shadow-lg dark:shadow-black/20 lg:ml-[50px]"
                      alt="image"
                    />
                  </div>
                </div>

                <div class="w-full shrink-0 grow-0 basis-auto lg:w-7/12">
                  <div class="flex h-full items-center rounded-lg bg-yellow-600 p-6 text-center text-white lg:pl-12 lg:text-left">
                    <div class="lg:pl-12">
                      <h2 class="mb-8 text-3xl font-bold"> {item.title} </h2>
                      <p class="mb-8 pb-2 lg:pb-0">{item.description}</p>

                      <div class="mx-auto mb-8 flex flex-col md:flex-row md:justify-around xl:justify-start">
                        {item.benefits.map((benef) => (
                          <>
                          <span className="text-5xl m-2 p-2"> {benef?.icon}</span> 
                            <p class="mx-auto w-[50px] mb-4 flex items-center md:mx-0 md:mb-2 lg:mb-0 xl:mr-20">
                            
                              {benef.name}
                            </p>
                          </>
                        ))}
                      </div>

                      <p>{item.text}</p>
                    </div>
                  </div>
                </div>
              </div>
            </>
          ))}
        </section>
      </div>
    </div>
  );
};

export default Blog;
