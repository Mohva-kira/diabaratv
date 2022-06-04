import React, { useState, useEffect } from "react";
import './playlist.css'
import Icon from '../svg/svg'

const Playlist = () => {

    return(
        <div className="col-4 playlist-item d-flex align-items-end justify-content-around mt-3"> 
            {/* <p className="artistlist">ma playlist</p> */}
            <div className="d-flex playlist-details align-items-center w-100 h-50 mb-2 justify-content-between bg-info bg-opacity-25 rounded-pill">
                <div className="my-3 ms-2 p-3">
                    <p className="fw-bold mb-0">Titre</p>
                    <div className="d-flex justify-content-between track">
                    <span className="mt-2 me-2"><Icon name="music-note-beamed" size="15px"/></span> <p>10 Tracks</p>
                    </div>
                </div>
                <div className="float-right">
                <button className="btn rounded-circle"><Icon name="play-circle" size="15px"/></button>
                </div>
            </div>
        </div>
    )

   
 }

export default Playlist;