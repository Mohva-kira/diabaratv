import React, { useState, useEffect } from "react";
import {useAppDispatch, useAppSelector} from "../app/hooks";
import { Formik, Field, Form, ErrorMessage} from "formik";
import * as Yup from "yup";
import { register} from "../slices/auth";
import { clearMessage } from "../slices/message";

const Register = () =>  {
    const [successful, setsuccessful] = useState(false);
    const { message } = useAppSelector((state: any) => state.message);
    const dispatch = useAppDispatch();

    useEffect(() => {
        dispatch(clearMessage());
    }, [dispatch]);

    const initialValues = {
        username: "",
        email: "",
        password: "",
    };

    const validationSchema = Yup.object().shape({
        firstName: Yup.string()
            .test(
                "len",
                "The first name must be between 3 and 20 characters. ",
                (val: any) => val &&
                    val.toString().length >= 3 &&
                    val.toString().length <= 20
            )
            .required("This field is required!"),
        lastName: Yup.string()
            .test(
                "len",
                "The last name must be between 3 and 20 characters. ",
                (val: any) => val &&
                    val.toString().length >= 3 &&
                    val.toString().length <= 20
            )
            .required("This field is required!"),
        email: Yup.string()
            .email("This is not a valid email.")
            .required("This field is required!"),
        password: Yup.string()
            .test("len",
                "The password must be between 6 and 40 characters.",
                (val: any) =>
                val &&
                    val.toString().length >= 6 &&
                    val.toString().length <= 40
            )
            .required("This field is required")
    });

    const handleRegister = (formValue: any) => {
        const {firstName, lastName, email, password} = formValue;
        setsuccessful(false);
        dispatch(register({firstName, lastName, email, password}))
            .unwrap()
            .then(()=> {
                setsuccessful(true);
            })
            .catch(()=> { setsuccessful(false) })
    };

    return(
        <div className="col-md-12 signup-form">
            <div className="card card-container">
                <img src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="profile-img" className="profile-img-card"/>

                <Formik
                    initialValues={initialValues}
                    validationSchema={validationSchema}
                    onSubmit={handleRegister}>
                    <Form>
                        {!successful && (<div>
                            <div className="form-group">
                                <label htmlFor="firstName">First name</label>
                                <Field name="firstName" type="text" className="form-control"/>
                                <ErrorMessage
                                name="firstName"
                                component="div"
                                className="alert alert-danger"
                                />
                            </div>
                            <div className="form-group">
                                <label htmlFor="lastName">Last name</label>
                                <Field name="lastName" type="text" className="form-control" />
                                <ErrorMessage
                                    name="lastName"
                                component="div"
                                className="alert alert-danger"/>
                            </div>
                            <div className="form-group">
                                <label htmlFor="email">Email</label>
                                <Field name="email" type="email" className="form-control" />
                                <ErrorMessage
                                    name="email"
                                component="div"
                                className="alert alert-danger"/>
                            </div>
                            <div className="form-group">
                                <label htmlFor="password">Password </label>
                                <Field name="password" type="paswword" className="form-control" />
                                <ErrorMessage
                                    name="password"
                                component="div"
                                className="alert alert-danger"/>
                            </div>

                            <div className="form-group">
                                <button type="submit" className="btn btn-primary btn-block">Sign Up</button>
                            </div>
                        </div>) }
                    </Form>

                </Formik>

            </div>
            {message && (
                <div className="form-group">
                    <div
                        className={successful ? "alert alert-success" : "alert alert-danger"}
                        role="alert"
                    >
                        {message}
                    </div>
                </div>
            )}
        </div>
    );
};

export default Register