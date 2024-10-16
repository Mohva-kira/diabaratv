import React from "react";
import PricingCard from "../components/PricingCard";

const Pricing = () => {
  const data = [{}, {}, {}];
  return (
    <div className="w-full  space-x-2 ">
      <div className="w-full p-2 pt-10 items-center justify-center">
        <h2 className="w-full text-sm text-orange-500 font-light text-center">
          Nos offres
        </h2>
        <p className="w-full text-2xl text-white font-semibold text-center">
          Exclusivité. Illimité. Privilège.
        </p>
        <p className="w-full text-2xl text-white font-semibold text-center">
          Pour tout le monde
        </p>
        <p className="w-full text-lg text-slate-300 font-medium text-center">
          Rejoignez notre communauté d'auditeurs VIP et bénéficiez d'un accès
          exclusif à des fonctionnalités que vous ne trouverez nulle part
          ailleurs.
        </p>
      </div>
      <div className="w-full lg:flex lg:spqce-x-2 pt-5 p-2 ">
        {data.map((item) => (
          <PricingCard />
        ))}
      </div>
    </div>
  );
};

export default Pricing;
