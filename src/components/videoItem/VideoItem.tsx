import React, { useRef, useState } from 'react'
import Icon from '../svg/svg';
import './videoItem.css';

const VideoItem = (props: any) => {
    const [isLoading, setIsLoading] = useState(false);
    const videoElement = useRef();

  return (
    <div className="col-3 d-flex align-items-end justify-content-center videoItem rounded" style={{backgroundImage:`url(http://localhost/diabaraServer${props.video.image})`, 
                                                      backgroundRepeat: 'no-repeat', backgroundSize:'cover' }}>
        <div className="">
          <button className="btn border-success ms-3 rounded-circle">
            <Icon name="play-circle" size="20" color="white"/>
          </button>
            <p className="text-white fw-bold text-center fs-5 mb-0"> {props.video.title}  </p>
            <p className="text-white fw-bold text-center fs-6 mb-0" > {props.video.artiste_id} </p>
        </div>
    </div>
  )
}

export default VideoItem