import React, {Component} from 'react';
import "./playerDetails.css"
import Icon from "../../svg/svg";

const PlayerDetails  = (props: any) => {
        return (
            <div className="c-player--details">
                <div className="details-img d-flex align-items-end" style={{backgroundImage:`url(http://localhost/diabaraServer${props.song?.image})`}}>
                    {/*<img src={`http://localhost/diabaraServer${props.song?.image}`} alt=""/>*/}
                    <svg className="align-self-end" width="100%" height="25%">
                        <use xlinkHref="#icons_curve"/>
                    </svg>
                </div>

                <h3 className="details-title"> {props.song?.title} </h3>
                <h4 className="details-artist"> {props.song?.artiste_id} </h4>
            </div>
        );
    }


export default PlayerDetails;