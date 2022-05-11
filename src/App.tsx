import React, {useCallback, useEffect, useState} from 'react'
import {Outlet, Link, BrowserRouter} from "react-router-dom";
import './App.css'
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

import {useAppDispatch, useAppSelector} from "./app/hooks";
import {logout} from "./slices/auth";



import Sidebar from "./components/sidebar/Sidebar";

function App() {
  const [count, setCount] = useState(0)

    const {user: currentUser} = useAppSelector((state: any) => state.auth);
    const dipatch = useAppDispatch();

    const logOut = useCallback(()=> {
        dipatch(logout());
    }, [dipatch]);


  return (
    <div className="App container-fluid  h-100">
        <div className="row h-100  ">
            <div className="col">
                <Sidebar/>
            </div>


            <div className="col-md-9" >
              <Outlet />
            </div>
        </div>




    </div>


  )
}

export default App
