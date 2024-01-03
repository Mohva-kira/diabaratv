import React from "react";
import {
  AccumulationChartComponent,
  AccumulationSeriesCollectionDirective,
  AccumulationSeriesDirective,
  Inject,
  AccumulationLegend,
  AccumulationDataLabel,
  AccumulationTooltip,
  PyramidSeries,
  AccumulationSelection,
} from "@syncfusion/ej2-react-charts";

import { Header } from "../../components";

import {
  PyramidData,
} from "../../data/dummy";
import { useStateContext } from "../../contexts/ContextProvider";


const Pyramid = () => {
  const { currentMode } = useStateContext();

  return (
    <div className='m-4 md:m-10 mt-24 p-10 bg-white dark:bg-secondary-dark-bg rounded-3xl'>
        <Header category='Pyramid' title="Comparison Chart" />
        <div className='w-full'>
      <AccumulationChartComponent
        id="pyramid-chart"
        height="420px"
       legendSettings={{background: 'white'}}
        chartPyramid={{ border: { width: 0 } }}
        tooltip={{ enable: true }}
        background={currentMode === "Dark" ? "dark" : "#fff"}
      >
        <Inject services={[AccumulationDataLabel, AccumulationTooltip, PyramidSeries, AccumulationLegend, AccumulationSelection]} />
        <AccumulationSeriesCollectionDirective>
         
            <AccumulationSeriesDirective
              name="Food" 
              dataSource={PyramidData}
              xName="x"
              yName="y"
              width="45%"
              neckWidth="15%"
              gapRatio={0.3}
              explode
              emptyPointSettings={{mode: 'Drop', fill: 'red' }}
              dataLabel={{
                visible: true,
                position: 'Inside',
                name: 'text',
                
              }}
             />
        
        </AccumulationSeriesCollectionDirective>
      </AccumulationChartComponent>
      </div>
    </div>
  );
};

export default Pyramid;
