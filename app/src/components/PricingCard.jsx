import React from "react";

const PricingCard = () => {
  return (
    <div className="w-1/3  h-full ">
      <div className="w-full p-[2px] rounded-2xl  bg-orange-500 border-orange-500 border-2">
        <div className="bg-blue-700 rounded-2xl top-10 h-full mt-10  w-full p-2">
          <div className="w-full flex justify-between m-2 p-2">
            <span className="w-5 h-5 rounded-full bg-slate-50 "> </span>
            <p className="p-2 bg-slate-50 w-fit h-fit rounded-2xl">
              Economise 10%
            </p>
          </div>

          <div className="flex flex-col">
            <h2 className="text-slate-100 font-bold">Starter</h2>
            <p className="text-slate-300">
              Pour personnes désirant écouter hors ligne sans publicité
            </p>
          </div>

          <div className="w-full flex items-center">
            <h2 className="text-2xl p-2 text-white font-bold">750 Fcfa</h2>{" "}
            <p className="text-md font-medium text-white items-end  ">/ mois</p>
          </div>

          <p className="text-orange-500 text-lg items-start font-light">
            +3 mois <span className="font-bold">GRATUIT</span>
          </p>

          <div className="p-2 m-1">
            <input type="checkbox" />{" "}
            <span className="text-slate-100"> Ajoutez 3 appareils</span>
          </div>

          <div className="w-full p-2">
            <h2 className="bg-orange-400 w-full text-white p-1 text-center font-bold  rounded-3xl">
              S'abonner{" "}
            </h2>
          </div>
        </div>
      </div>
    </div>
  );
};

export default PricingCard;
