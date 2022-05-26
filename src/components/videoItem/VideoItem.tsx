import React, { useRef, useState } from 'react'

const VideoItem = (props: any) => {
    const [isLoading, setIsLoading] = useState(false);
    const video = props.videos;
    const videoElement = useRef();

  return (
    <div className="col-3 rounded">
        <div className='bol'>
            
        </div>
    </div>
  )
}

export default VideoItem