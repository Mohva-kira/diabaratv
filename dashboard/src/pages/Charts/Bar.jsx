import React from "react";
import {
  ChartComponent,
  SeriesCollectionDirective,
  SeriesDirective,
  Inject,
  DateTime,
  Legend,
  Tooltip,
  BarSeries,
  ColumnSeries,
  Category,
  DataLabel
} from "@syncfusion/ej2-react-charts";

import { Header } from "../../components";

import { barCustomSeries, barPrimaryXAxis, barPrimaryYAxis } from "../../data/dummy";
import { useStateContext } from "../../contexts/ContextProvider";

const Bar = () => {
  const {currentMode } = useStateContext()

  return (
    <div className='m-4 md:m-10 mt-24 p-10 bg-white dark:bg-secondary-dark-bg rounded-3xl'>
    <Header category='Bar' title="Inflation Rate in Percentage" />

    <ChartComponent
    id="charts"
    height="420px"
    primaryXAxis={barPrimaryXAxis}
    primaryYAxis={barPrimaryYAxis}
    chartBar={{border: {width: 0}}}
    tooltip={{enable:true}}
    background={currentMode === 'Dark' ? 'dark' : '#fff'}
    >
    <Inject services={[ColumnSeries, Category, DataLabel , Legend, Tooltip]} />
    <SeriesCollectionDirective>
      {barCustomSeries.map((item, index) => <SeriesDirective key={index} {...item} /> )

      }
    </SeriesCollectionDirective>
  </ChartComponent>
  </div>
  );
};

export default Bar;
