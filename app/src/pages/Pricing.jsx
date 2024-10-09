import React from "react";
import PricingCard from "../components/PricingCard";

const Pricing = () => {
  const data = [{}, {}, {}];
  return (
    <div className="w-full flex space-x-2 ">
      {data.map((item) => (
        <PricingCard />
      ))}
    </div>
  );
};

export default Pricing;
