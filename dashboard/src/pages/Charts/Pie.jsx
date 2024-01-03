import React from "react";
import PieChart from "../../components/Charts/PieChart";

import { Header } from "../../components";

import { pieChartData, pie, PiePrimaryYAxis } from "../../data/dummy";
import { useStateContext } from "../../contexts/ContextProvider";

const Pie = () => {
  const {currentMode } = useStateContext()

  return (
    <div className='m-4 md:m-10 mt-24 p-10 bg-white dark:bg-secondary-dark-bg rounded-3xl'>
    <Header category='Pie' title="Inflation Rate in Percentage" />

     <PieChart id="chart-pie" data={pieChartData} legendVisiblity height="full" />
  </div>
  );
};

export default Pie;
