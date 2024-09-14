import React, { useState, useRef, useEffect } from "react";
import { useNavigate } from "react-router-dom";

import { useDispatch } from "react-redux";
import { setCredentials } from "../redux/features/auth/authSlice";

import { useForm } from "../components/hook/form-hook";
import Input from "../components/Input";
import { Register } from "../components";
import { Link } from "react-router-dom";
import { Login } from "../components";
import { useLoginMutation } from "../redux/services/auth";
import { useRegisterMutation } from "../redux/services/auth";

const Auth = () => {
  const userRef = useRef();
  const errRef = useRef();
  const [errMsg, setErrMsg] = useState("");
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [formState, inputHandler, setFormData] = useForm({
    phone: { value: "" },
    password: { value: "" },
  });

  const [login, { isFetching }] = useLoginMutation();
  const [register, { isFetchingRegister }] = useRegisterMutation();

  // const [addNewUser, { isLoading }] = useAddUserMutation()
  const [isAuthMode, setIsAuthMode] = useState(true);
  const [haveAccount, setHaveAccount] = useState(true);

  const switchPage = () => {
    setHaveAccount(!haveAccount);
  };

  // switch between Auth and signup form
  const switchModeHandler = () => {
    // console.log('first')
    if (!isAuthMode) {
      setFormData({ name: undefined });
    } else {
      setFormData({ ...formState.inputs, name: { value: "" } });
    }

    setIsAuthMode((prevMode) => !prevMode);
  };

  const submitHandler = async (event) => {
    event.preventDefault();
    console.log(JSON.stringify(formState.inputs));

    try {
      if (!isAuthMode) {
        formState.inputs.level = 1;
        formState.inputs.role = 2;
        await addNewUser(formState.inputs).unwrap();
      } else {
        console.log("first", formState.inputs);

        await login(formState.inputs)
          .unwrap()
          .then((response) => {
            console.log("connected", response);
            dispatch(setCredentials(response));
          });
      }
    } catch (error) {
      console.log(error);

      if (!error?.response) {
        setErrMsg("No Server Response");
      } else if (error?.response?.status === 400) {
        setErrMsg("Missing Username or Password");
      } else if (error?.response?.status === 401) {
        setErrMsg("Unauthorized");
      } else {
        setErrMsg("Auth Failed");
      }

      errRef.current.focus();
    }
  };

  useEffect(() => {
    userRef?.current?.focus();
  }, []);

  useEffect(() => {
    setErrMsg("");
  }, [formState.inputs]);

  return (
    <>
      {haveAccount ? (
        <Login
          login={login}
          switchModeHandler={switchModeHandler}
          switchPage={switchPage}
          isFetching={isFetching}
         
        />
      ) : (
        <Register
          switchModeHandler={switchModeHandler}
          switchPage={switchPage}
          register={register}
          isFetchingRegister={isFetchingRegister}
        />
      )}
    </>
  );
};

export default Auth;
