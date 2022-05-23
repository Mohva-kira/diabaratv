import "./videoPlayer.css";
import React, { useRef } from "react";
import VideoPlayerControls from "./videoPlayerControls/VideoPlayerControls";
import video from "../../assets/video.mp4"
import Icon from "../svg/svg";

export const VideoPlayer = () => {

    const videoEelement = useRef(null);
    const {
        playerState,
        togglePlay,
        handleOnTimeUpdate,
        handleVideoProgress,
        handleVideoSpeed,
        toggleMute
    } = VideoPlayerControls (videoEelement);
  return (
    <div className="container">
    
        <div className="video-wrapper" >
            <video src={video} 
                   ref={videoEelement}
                   onTimeUpdate={handleOnTimeUpdate} />

            <div className="controls">
                <div className="actions">
                    <button onClick={togglePlay}>
                        {!playerState.isPlaying ? (
                         <Icon name="play" />  
                        ): (
                            <Icon name="pause" />
                        )

                        }
                    </button>
                </div>
                <input 
                        type="range"
                        min="0" 
                        max="100"
                        value={playerState.progress}
                        onChange={(e) => handleVideoProgress(e)} />

                <select  
                    className="velocity" 
                    value={playerState.speed} 
                    onChange={(e) => handleVideoSpeed(e)} >
                        <option value="0.5">0.5</option>
                        <option value="1">1</option>
                        <option value="1.25">1.25</option>
                        <option value="2">2</option>


                    </select>
                    <button className="mute-btn" onClick={toggleMute}>
                        {!playerState.isMuted? (
                            <Icon name="volume-up"/>
                        ) : (
                            <Icon name="volume-mute"/>
                            )
                        }
                    </button>
            </div>
        </div>
       
        
    
    </div>
  )
}
