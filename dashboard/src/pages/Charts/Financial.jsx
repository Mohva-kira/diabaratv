import React from "react";
import {
  ChartComponent,
  SeriesCollectionDirective,
  SeriesDirective,
  Inject,
  DateTime,
  Legend,
  HiloSeries,
  Tooltip,
  Zoom,
  Logarithmic,
  Crosshair
} from "@syncfusion/ej2-react-charts";

import { Header } from "../../components";

import {
  financialChartData,
  FinancialPrimaryXAxis,
  FinancialPrimaryYAxis,
} from "../../data/dummy";
import { useStateContext } from "../../contexts/ContextProvider";

const date1 = new Date("2017", "1", "1");

const filterValue = (value) => {
  if (value.x > date1) {
    return value.x, value.high, value.low;
  }
};

const returnValue = financialChartData.filter(filterValue);

const Financial = () => {
  const { currentMode } = useStateContext();

  return (
    <div className='m-4 md:m-10 mt-24 p-10 bg-white dark:bg-secondary-dark-bg rounded-3xl'>
        <Header category='Financial' title="Historical" />
        <div className='w-full'>
      <ChartComponent
        id="Financial-chart"
        height="420px"
        primaryXAxis={FinancialPrimaryXAxis}
        primaryYAxis={FinancialPrimaryYAxis}
        chartFinancial={{ border: { width: 0 } }}
        tooltip={{ enable: true }}
        background={currentMode === "Dark" ? "dark" : "#fff"}
      >
        <Inject services={[HiloSeries, DateTime, Legend, Tooltip, Crosshair, Zoom]} />
        <SeriesCollectionDirective>
         
            <SeriesDirective 
              dataSource={returnValue}
              xName="x"
              yName="low"
              type="Hilo"
              low="low"
              high="high"
             />
        
        </SeriesCollectionDirective>
      </ChartComponent>
      </div>
    </div>
  );
};

export default Financial;
