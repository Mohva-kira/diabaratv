import React, {Component} from 'react';
import "./playerDetails.css"


const PlayerDetails  = (props: any) => {
        return (
            <div className="c-player--details">
                <div className="details-img">
                    <img src={`http://localhost/diabaraServer${props.song?.image}`} alt=""/>
                </div>

                <h3 className="details-title"> {props.song?.title} </h3>
                <h4 className="details-artist"> {props.song?.artiste_id} </h4>
            </div>
        );
    }


export default PlayerDetails;