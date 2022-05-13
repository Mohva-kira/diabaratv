import React, {useState, useRef, useEffect} from 'react';
import PlayerDetails from "../playerDetails/playerDetails";
import PlayerControls from "../playerControls/PlayerControls";
import './player.css'

const  Player= (props: any) => {
    const audioEl= useRef(null);
    const [isPlaying, setIsPlaying] = useState(false);

    useEffect(() => {
        if(isPlaying){
            // @ts-ignore
            audioEl.current.play();
        }else {
            // @ts-ignore
            audioEl.current.pause();
        }
    });
    const skipSong = (fowards = true) => {
        if(fowards){
            props.setCurrentSongIndex(() => {
                let temp = props.currentSongIndex;
                temp++;
                if (temp > props.songs.data.length -1){
                    temp=0;
                }

                return temp;
            })
        }else{
            props.setCurrentSongIndex(() => {
                let temp = props.currentSongIndex;
                temp--;
                if (temp < 0){
                    temp= props.songs.data.length -1;
                }

                return temp;
            })
        }
    }
        return (
            <div className="c-player">
                <audio src={`http://localhost/diabaraServer${props.songs.data[props.currentSongIndex].url}`} ref={audioEl}></audio>
                <h4> Playing now </h4>
                 <PlayerDetails song={props.songs.data[props.currentSongIndex]}/>
                 <PlayerControls isPlaying={isPlaying}
                                 setIsPlaying={setIsPlaying}
                                 skipSong={skipSong}
                 />
                <p> <strong>Next up:</strong> {props.songs.data[props.nextSongIndex].title} by {props.songs.data[props.nextSongIndex].artiste_id} </p>
            </div>
        );
    }

export default Player;
