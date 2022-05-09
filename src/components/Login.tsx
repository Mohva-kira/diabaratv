import {Formik, Field, Form, ErrorMessage} from "formik";
import * as Yup from "yup";
import React, { useState, useEffect  } from "react";
import {useAppSelector, useAppDispatch} from "../app/hooks";
import { login} from "../slices/auth";
import { clearMessage} from "../slices/message";

const Login = ({props}: any) => {
    const [loading, setLoading] = useState(false);
    const { isLoggedIn} = useAppSelector((state: any) => state.auth);
    const { message } = useAppSelector((state: any) => state.message);
    const dispatch = useAppDispatch();

    useEffect(()=>  {
        dispatch(clearMessage());
    }, [dispatch]);
    const initialValue = {
        username: "",
        password: ""
    };

    const validationSchema = Yup.object().shape({
        username: Yup.string().required("this field is required!"),
        password: Yup.string().required("This field is required!"),
    });

    const handleLogin = (formValue: any) => {
        const  {username, password} = formValue;
        setLoading(true);
        dispatch(login({ username, password }))
            .unwrap()
            .then(() => {
                props.history.push("/profile");
                window.location.reload();
            })
            .catch(() => {
                setLoading(false);
            });
    }

    return (

        <div className="col-md-12 login-form">

            <div className="card card-container">
                <img
                    src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"
                    alt="profile-img"
                    className="profile-img-card"
                />

        <Formik
            initialValues={initialValue}
        validationSchema={validationSchema}
        onSubmit={handleLogin}>
            <Form>
                <div className="form-group">
                    <label htmlFor="username">Username</label>
                    <Field name="username" type="text" className="form-control"/>
                    <ErrorMessage name="username" component="div" className="alert alert-danger" />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password</label>
                    <Field name="password" type="password" className="form-control" />
                    <ErrorMessage name="password" component="div" className=" alert alert-danger" />
                </div>
                <div className="form-group">
                    <button type="submit" className="btn btn-primary btn-block" > Login </button>
                    {loading && (
                        <span className="spinner-border spinner-border-sm"></span>
                    )}
                </div>
            </Form>
        </Formik>
            </div>
            {message && (
                <div className="form-group">
                    <div className="alert alert-danger" role="alert">
                        {message}
                    </div>
                </div>
            )}
        </div>
    );
};
export default Login;
