import React, {useState, useEffect, useCallback} from "react";
import './sidebar.css'
import {Link} from "react-router-dom";
import Icon from "../svg/svg";
import {useAppDispatch, useAppSelector} from "../../app/hooks";
import {logout} from "../../slices/auth";
import {eventBus} from "../../common/eventBus";

const Sidebar = (props: any) => {
    const [showModeratorBoard, setShowModeratorBoard] = useState(false);
    const [showAdminBoard, setShowAdminBoard] = useState(false);

    const {user: currentUser} = useAppSelector((state: any) => state.auth);
    const dipatch = useAppDispatch();

    const logOut = useCallback(() => {
        dipatch(logout());
    }, [dipatch]);

    useEffect(() => {
        console.log(" utilisateur courant", currentUser)
        if (currentUser) {
            setShowModeratorBoard(currentUser.role == "moderator");
            setShowAdminBoard(currentUser.role == "admin");
        } else {
            setShowModeratorBoard(false);
            setShowAdminBoard(false);
        }

        eventBus.on("logout", () => {
            logOut();
        });
        return () => {
            eventBus.remove("logout", () => {
            });
        };
    }, [currentUser, logOut]);
    return (
        <div className="d-flex flex-column flex-shrink-0 text-white bg-dark sidebar sidebar-sticky">


            <a href="/" className="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                <div className="bi me-2">
                    <Icon name="bootstrap" color="black"/>
                </div>

                <span className="fs-4">DiabaraTV</span>
            </a>

            <ul className="nav nav-pills flex-column mb-auto mt-3">
                <li className="nav-item">
                    <Link to={"/home"} className="nav-link">
                        <span className="bi me-2 ">
                            <Icon name="house-door" color="white"/>
                        </span>

                        Home
                    </Link>

                </li>

                {showAdminBoard && (
                    <li className="nav-item">
                        <Link to={"/add_song"} className="nav-link">
                            <span className="bi me-2 ">
                                <Icon name="plus-circle" color="white"/>
                            </span>
                            Add song
                        </Link>
                    </li>
                )}
                {showAdminBoard && (
                    <li className="nav-item">
                        <Link to={"/add_artist"} className="nav-link">
                           <span className="bi me-2 ">
                                <Icon name="plus-circle" color="white"/>
                            </span>
                            Add artist
                        </Link>
                    </li>
                )}


                <li>
                    <a href="#" className="nav-link text-white">

                        <span className="bi me-2 ">
                            <Icon name="soundwave" color="white"/>
                        </span>
                        Genres
                    </a>
                </li>
                <li>
                    <a href="#" className="nav-link text-white">

                        <span className="bi me-2 ">
                            <Icon name="folder2-open" color="white"/>
                        </span>
                        Albums
                    </a>
                </li>
                <li>
                    <a href="#" className="nav-link text-white">
                        <span className="bi me-2 ">
                            <Icon name="person" color="white"/>
                        </span>
                        Artist
                    </a>
                </li>
            </ul>

            {showAdminBoard && (
                <ul className="nav nav-pills flex-column mb-auto mt-3">
                    <li className="nav-item">
                        <Link to={"/home"} className="nav-link">
                        <span className="bi me-2 ">
                            <Icon name="heart" color="white"/>
                        </span>

                            Favourites
                        </Link>

                    </li>


                    <li>
                        <a href="#" className="nav-link text-white">

                        <span className="bi me-2 ">
                            <Icon name="graph-up" color="white"/>
                        </span>
                            Popular
                        </a>
                    </li>
                    <li>
                        <a href="#" className="nav-link text-white">
                        <span className="bi me-2 ">
                            <Icon name="folder" color="white"/>
                        </span>
                            My Music
                        </a>
                    </li>
                </ul>
            )}
            <hr/>

            <div className="dropdown">
                <a href="#" className="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                   id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="" width="32" height="32"
                         className="rounded-circle me-2"/>
                    <strong>mdo</strong>
                </a>
                <ul className="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                    {currentUser ? (
                        <>
                            <li className="dropdown-item">
                                <Link to={"/profile"} className="nav-link">
                                    {currentUser.username}
                                </Link>
                            </li>
                            <li className="dropdown-item">
                                <a href="/login" className="nav-link" onClick={props.logOut}>
                                    LogOut
                                </a>
                            </li>
                        </>
                    ) : (
                        <>
                            <li>
                                <Link to={"/login"} className="dropdown-item">
                                    Login
                                </Link>
                            </li>
                            <li>
                                <Link to={"/register"} className="dropdown-item">
                                    Sign Up
                                </Link>
                            </li>
                        </>
                    )}
                </ul>
            </div>
        </div>
    )
}

export default Sidebar