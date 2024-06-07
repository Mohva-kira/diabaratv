import React from 'react';

const {onLine} = window.navigator
const Track = ({ isPlaying, isActive, activeSong }) => (
  <div className="flex-1 flex items-center justify-start">
    <div className={`${isPlaying && isActive ? 'animate-[spin_3s_linear_infinite]' : ''} hidden sm:block h-16 w-16 mr-4`}>
      <img src={onLine ? `https://api.diabara.tv${activeSong?.attributes.cover.data[0].attributes.url}` : activeSong?.attributes.cover} alt="cover art" className="rounded-full" />
    </div>
    <div className="w-[50%]">
      <p className="truncate text-white font-bold text-lg">
        {activeSong?.attributes.name ? activeSong?.attributes.name : 'No active Song'}
      </p>
      <p className="truncate text-gray-300">
        {activeSong?.attributes?.artist ? activeSong?.attributes?.artist.data.attributes.name : 'No active Song'}
      </p>
    </div>
  </div>
);

export default Track;
