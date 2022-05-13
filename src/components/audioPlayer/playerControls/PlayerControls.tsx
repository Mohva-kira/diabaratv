import React from 'react';
import Icon from '../../svg/svg'
import './playerControls.css'
const PlayerControls = (props: any) => {

        return (
            <div className="c-player--controls">
                <button className="skip-btn" onClick={() => props.skipSong(false)}>
                    <Icon name="skip-backward-circle"/>
                </button>
                <button className="play-btn" onClick={() => props.setIsPlaying(!props.isPlaying)}>
                    <Icon name={props.isPlaying? 'pause-circle' : 'play-circle' } />
                </button>
                <button className="skip-btn" onClick={() => props.skipSong()}>
                    <Icon name="skip-forward-circle"/>
                </button>

            </div>
        );

}

export default PlayerControls;