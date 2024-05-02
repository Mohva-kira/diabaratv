/* eslint-disable jsx-a11y/media-has-caption */
import React, { useRef, useEffect, useState } from 'react';
import { setStreams, useGetStreamsQuery, usePostStreamsMutation } from '../../redux/services/streams';
import { useDispatch, useSelector } from 'react-redux';

const Player = ({ activeSong, isPlaying, volume, seekTime, onEnded, onTimeUpdate, onLoadedData, repeat }) => {
  const ref = useRef(null);

  const [streamTime, setStreamTime] = useState(0)
  const [startTime, setStartTime] = useState()
  const [streamStarted, setStreamStarted] = useState(false)
  const [postStream] = usePostStreamsMutation()
  const {data: streamData, currentData, refetch} = useGetStreamsQuery()
  const stateUser = useSelector(state => state.auth)
  const storageUser =  localStorage.getItem('auth') && JSON.parse(localStorage.getItem('auth'))
  const user = stateUser?.auth?.user ? stateUser : storageUser
  const song = useSelector(state =>  state.player.activeSong) 
  const [isCompleted, setIsCompleted] = useState(false)
  const dispatch = useDispatch()

  const updateStreamTime = () => {
    if (streamStarted) {
      setStreamTime(ref.current.currentTime);
    }
  };

  const myUuid = localStorage.getItem('uuid')
  

  const find = streamData?.data.find(item => item.attributes?.uuid === myUuid  && item?.attributes?.song?.data?.id === song?.id)

  // console.log('stream Time', streamTime)
  // console.log('found', find)
  // console.log('StreamData', streamData)
  // console.log('uuid', myUuid)
  
  
  const checkStreamDuration = async () => {
    // console.log('stream Time 2', streamTime)
    if (streamTime >= 60 && !find && !isCompleted ) {
      // Faire quelque chose lorsque la chanson a été streamée pendant plus d'une minute
      console.log("La chanson a été streamée pendant plus d'une minute !");

    if(find) {
      console.log('streamed', find)
      return
    }

      setIsCompleted(!isCompleted); // Mettre à jour l'état du post à true pour éviter les posts supplémentaires
      let data = {user: user?.user.id, song: song.id, start: startTime, end: new Date(), uuid: localStorage.getItem('uuid')}
      try {
        await  postStream(JSON.stringify({data})).then(rep => console.log('enRegistrer'))
        refetch()
        forceUpdate()
       
      } catch (error) {
        
      }
     
      
    }

    
  };
  

  const startStream = () => {
    setStreamStarted(true);
    setStartTime(new Date())
  };

  


  useEffect(() => {

  
  // console.log('active song', song)
  // console.log('user', user)
  
  

    // console.log('streamTIme', streamTime)
    startStream()
    updateStreamTime()
    checkStreamDuration() 

  }, [streamTime, streamStarted, onTimeUpdate])
 
  // eslint-disable-next-line no-unused-expressions

  // console.log('stream data data', streamData)
  if (ref.current) {

    
    if (isPlaying) {
      ref.current.play();
     
      
    } else {
      ref.current.pause();
    }
  }

  useEffect(() => {
    ref.current.volume = volume;
  }, [volume]);
  // updates audio element only on seekTime change (and not on each rerender):
  useEffect(() => {
    ref.current.currentTime = seekTime;
   
  }, [seekTime]);

  useEffect(() => {
    updateStreamTime()
  }, [isPlaying])

  useEffect(() => {
    dispatch(setStreams(currentData?.data))
  },[refetch])

  return (
    <audio
      src={`https://api.diabara.tv${activeSong?.attributes.audio.data.attributes.url}`}
      ref={ref}
      loop={repeat}
      onEnded={onEnded}
      onTimeUpdate={onTimeUpdate}
      onLoadedData={onLoadedData}
    />
  );
};

export default Player;
