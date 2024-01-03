import { useLocation, Navigate, Outlet } from "react-router-dom";
import { useSelector } from "react-redux";
import { selectCurrentToken } from "../redux/features/auth/authSlice";

import React from 'react'

const RequireAuth = () => {

    const token = useSelector(selectCurrentToken) ? useSelector(selectCurrentToken) : JSON.parse(localStorage.getItem('auth'))
    console.log('token !!!', token)
    const location = useLocation()

  return (
    token
    ? <Outlet />
    : <Navigate to='/login' state={{from:location}} replace />
  )
}

export default RequireAuth