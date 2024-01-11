import { useLocation, Navigate, Outlet } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { selectCurrentToken } from "../redux/features/auth/authSlice";

import React from 'react'

const RequireAuth = () => {
  
    const dispatch = useDispatch()
    const stateToken = selectCurrentToken()
    const storageAuth = JSON.parse(localStorage.getItem('auth'))
    const token = stateToken? stateToken: storageAuth.jwt 
    console.log('token !!!', storageAuth.jwt)
    const location = useLocation()

  return (
    token
    ? <Outlet />
    : <Navigate to='/login' state={{from:location}} replace />
  )
}

export default RequireAuth