import React, { useRef } from "react";
import "./index.css";

import { video } from "../../assets";
import useVideoPlayer from "../../hooks/useVideoPlayer";
import { CiVolumeMute, CiVolumeHigh, CiPlay1, CiPause1 } from "react-icons/ci";


const VideoPlayer = () => {
  const videoElement = useRef(null);
  const {
    playerState,
    togglePlay,
    handleOnTimeUpdate,
    handleVideoProgress,
    handleVideoSpeed,
    toggleMute,
  } = useVideoPlayer(videoElement);

  return (
    
      <div className="video-wrapper sm:w-[720px]">
        <iframe className="sm:w-{720px]" width="100%" height="360"  src="https://www.youtube.com/embed/y9cmtSXADKY?si=_Stz3lVp0rNLhNmg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        {/* <video
          src={video}
          ref={videoElement}
          onTimeUpdate={handleOnTimeUpdate}
        /> */}
        {/* <div className="controls">
          <div className="actions text-white text-2xl">
            <button onClick={togglePlay}>
              {!playerState.isPlaying ? (
                <CiPlay1 />
              ) : (
                <CiPause1 />
              )}
            </button>
          </div>
          <input
            type="range"
            min="0"
            max="100"
            value={playerState.progress}
            onChange={(e) => handleVideoProgress(e)}
          />
          <select
            className="velocity"
            value={playerState.speed}
            onChange={(e) => handleVideoSpeed(e)}
          >
            <option value="0.50">0.50x</option>
            <option value="1">1x</option>
            <option value="1.25">1.25x</option>
            <option value="2">2x</option>
          </select>
          <button className="mute-btn text-white" onClick={toggleMute}>
            {!playerState.isMuted ? (
              <CiVolumeHigh />
            ) : (
              <CiVolumeMute />
            )}
          </button>
         
        </div> */}
      </div>
 
  );
};

export default VideoPlayer;
