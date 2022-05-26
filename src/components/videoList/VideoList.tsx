import React, {useEffect, useState} from 'react'
import { useAppDispatch, useAppSelector } from '../../app/hooks'
import { useGetVideosQuery, selectAllVideos, selectVideoById } from '../../slices/video'
import { clearMessage } from '../../slices/message'


const VideoList = () => {
const dispatch = useAppDispatch();
const video = useAppSelector(selectAllVideos)
const {data: videos, isLoading, isSuccess, isError, error} = useGetVideosQuery('');
useEffect(() => {
    dispatch(clearMessage());
}, [dispatch])

  return (
    <div>
        {isError ? (
                <>oh no there's no video. {error.toString()} </>
                    )
           :isLoading ? (
               <>...Loading</>
                        )
                        
           :isSuccess ? (
               <>
                {videos.data.map((video: any, i: any): any => (
                    <div>
                        {video.title}
                    </div>
                ))

                }
                
                </>
           ) : null

        } 
    </div>
  )
}

export default VideoList