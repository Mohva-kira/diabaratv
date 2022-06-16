import React, { useState } from 'react'
import { Formik, Field, Form, ErrorMessage, useFormikContext } from "formik";
import * as Yup from "yup";
import { useAppSelector } from '../../../app/hooks';
import { useAddPlaylistMutation } from '../../../slices/playlist';
import { useNavigate } from 'react-router-dom';

const AddPlaylist = () => {

    const [isLoading, setIsLoading] = useState(false);
    const { user: currentUser } = useAppSelector((state: any) => state.auth);
    const [addPlaylist] = useAddPlaylistMutation();
    const history = useNavigate()
    const initialValue = {
        name: "",
        userId: ""
    }

    const validationSchema = Yup.object().shape({
        name: Yup.string().required("this field is required!"),
    })



    const handleSubmit = async (formValue: any) => {
        setIsLoading(true)

        formValue.userId = currentUser.id;
        const { name, userId } = formValue;

        await addPlaylist({ name, userId })
            .unwrap()
            .then(() => {
                history("/home")
                window.location.reload();
            })


    }

    return (
        <div className="justify-content-center">

            <Formik
                initialValues={initialValue}
                validationSchema={validationSchema}
                onSubmit={handleSubmit}>
                <Form>
                    <div className="d-flex justify-content-center align-items-center">
                        <div className="form-group">
                            <label htmlFor="name" className="mb-2"> Playlist name
                                <Field type="text" name="name" className="form-control w-75 mx-2" />
                            </label>
                        </div>
                        <div className="form-group mt-3 ">
                            <button type="submit" className="btn btn-primary btn-block"> Add playlist</button>
                            {isLoading && (
                                <span className="spinner-border spinner-border-sm"></span>
                            )}
                        </div>

                        <div>

                        </div>
                    </div>
                </Form>
            </Formik>
        </div>
    )
}

export default AddPlaylist