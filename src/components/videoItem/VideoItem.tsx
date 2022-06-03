import React, { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom';
import { useAppDispatch, useAppSelector } from '../../app/hooks';
import Icon from '../svg/svg';
import './videoItem.css';

const VideoItem = (props: any) => {
  const [isLoading, setIsLoading] = useState(false);
  const videoElement = useRef();
  const [showModeratorBoard, setShowModeratorBoard] = useState(false);
  const [showAdminBoard, setShowAdminBoard] = useState(false);

  const { user: currentUser } = useAppSelector((state: any) => state.auth);
  const dipatch = useAppDispatch();

  useEffect(() => {

    if (currentUser) {
      setShowModeratorBoard(currentUser.role == "moderator");
      setShowAdminBoard(currentUser.role == "admin");
    } else {
      setShowModeratorBoard(false);
      setShowAdminBoard(false);
    }

  })
  return (
    <div className="col-3 d-flex align-items-end justify-content-center p-2 m-2 videoItem rounded" style={{
      backgroundImage: `url(http://localhost/diabaraServer${props.video.image})`,
      backgroundRepeat: 'no-repeat', backgroundSize: 'cover'
    }}>
      <div className="">
        <button className="btn border-success ms-3 rounded-circle">
          <Icon name="play-circle" size="20" color="white" />
        </button>
        <p className="text-white fw-bold text-center fs-5 mb-0"> {props.video.title}  </p>
        <p className="text-white fw-bold text-center fs-6 mb-0" > {props.video.artiste_id} </p>
      </div>
    {showAdminBoard && 
      <div>
        <Link to={`/edit_video/${props.video.id}`}>
          <button className="btn btn-warning">

        <Icon name="pencil" size="12" color="white" />
            
          </button>
        </Link>
      </div>
      }
    </div>
  )
}

export default VideoItem