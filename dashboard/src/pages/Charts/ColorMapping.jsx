import React from "react";
import {
  ChartComponent,
  SeriesCollectionDirective,
  SeriesDirective,
  Inject,
  ColumnSeries,
  Category,
  Legend,
  RangeColorSettingsDirective,
  RangeColorSettingDirective,
  Tooltip,

} from "@syncfusion/ej2-react-charts";

import { Header } from "../../components";

import {
  colorMappingData,
  ColorMappingPrimaryXAxis,
  ColorMappingPrimaryYAxis,
  rangeColorMapping
} from "../../data/dummy";
import { useStateContext } from "../../contexts/ContextProvider";



const ColorMapping = () => {
  const { currentMode } = useStateContext();

  return (
    <div className='m-4 md:m-10 mt-24 p-10 bg-white dark:bg-secondary-dark-bg rounded-3xl'>
        <Header category='ColorMapping' title="Climate - Weather by month" />
        <div className='w-full'>
      <ChartComponent
        id="ColorMapping-chart"
        height="420px"
        primaryXAxis={ColorMappingPrimaryXAxis}
        primaryYAxis={ColorMappingPrimaryYAxis}
        chartColorMapping={{ border: { width: 0 } }}
        tooltip={{ enable: true }}
        background={currentMode === "Dark" ? "dark" : "#fff"}
      >
        <Inject services={[ColumnSeries, Legend, Tooltip, Category]} />
        <SeriesCollectionDirective>
         
            <SeriesDirective 
              name="USA"
              dataSource={colorMappingData[0]}
              xName="x"
              yName="y"
              type="Column"
              cornerRadius={{
                topLeft: 10,
                topRight: 10
              }}
             />
        
        </SeriesCollectionDirective>

            <RangeColorSettingsDirective>
              {rangeColorMapping.map((item, index) => <RangeColorSettingDirective key={index} {...item} /> )}
            </RangeColorSettingsDirective>
      </ChartComponent>
      </div>
    </div>
  );
};

export default ColorMapping;
