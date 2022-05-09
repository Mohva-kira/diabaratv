import React, {useEffect, useState} from "react";
import {Formik, Field, Form, ErrorMessage, useFormikContext} from "formik";
import * as Yup from "yup";
import {useAppSelector, useAppDispatch} from "../../app/hooks";
import {clearMessage} from "../../slices/message"
import {createArtist} from "../../slices/artist";
import {uploadFile} from "../../slices/uploadFile";

const AddArtist = ({props}:any) => {
    const [loading, setLoading] = useState(false);
    const {isLoggedInd} = useAppSelector((sate: any) => sate.auth)
    const {message} = useAppSelector((state: any) => state.message);
    const [selectedImage, setSelectedImage] = useState<any>({})
    const [isImagePicked, setIsImagePicked] = useState(false);
    const [imageUrl, setImageUrl] = useState<any>();
    const dispatch = useAppDispatch()

    useEffect(() => {
        dispatch(clearMessage())
    }, [dispatch])

    const initialValue = {
        name: "",
        location: "",
        image: "",
        create_at:"",
        updated_at: "",
        status: "0",
        created_user:"",
        url: "",

    }

    const validationSchema = Yup.object().shape({
        name: Yup.string().required("this field is required!"),
        location: Yup.string().required("This field is required!"),
        // image: Yup.string().required("This field is required!"),

    });

    const changeHandler = (event: any) => {
        console.log(event.target.files[0].type)
        if (event.target.files[0].size >= 10000000) {

            alert("file too big")
        } else {
            if (event.target.files[0].name.match(/.(jpg|jpeg|png|gif)$/i)) {
                setSelectedImage(event.target.files[0]);
                setIsImagePicked(true);
                setImageUrl('/uploads/' + event.target.files[0].name)
            } else {

                alert("Choose an image");
            }


        }


    }

    const handleAddArtist = (formValue: any) => {
        formValue.image = imageUrl;
        formValue.status = 1;
        formValue.created_user = 1;
        formValue.create_at= new Date();
        const {name, location, image, create_at, status, created_user} = formValue;
        setLoading(true);
        handleFileUpload();


        dispatch(createArtist({name, location, image, create_at, status, created_user}))
            .unwrap()
            .then(() => {
                props.history.push("/home");
                window.location.reload()
            })
            .catch(() => {
                setLoading(false);
            })

    }

    const handleFileUpload = () => {
        const formData = new FormData();

        formData.append('Image', selectedImage)
        setLoading(true);
        dispatch(uploadFile(formData))
            .unwrap()
            .then(() => {
                setLoading(false);
            })
            .catch(() => {
                setLoading(false);
            })


    };
    return(
        <div>
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
                        onSubmit={handleAddArtist}>
                        <Form>
                            <div className="form-group">
                                <label htmlFor="name">Name</label>
                                <Field name="name" type="text" className="form-control"/>
                                <ErrorMessage name="name" component="div" className="alert alert-danger"/>
                            </div>
                            <div className="form-group">
                                <label htmlFor="location">location</label>
                                <Field name="location" type="text" className="form-control"/>
                                <ErrorMessage name="location" component="div" className=" alert alert-danger"/>
                            </div>

                            <div className="form-group">
                                <label htmlFor="image">Image</label>
                                <Field name="image" type="file"  onChange={changeHandler} className="form-control"/>

                                <ErrorMessage name="image" component="div" className=" alert alert-danger"/>
                                {isImagePicked ? (
                                    <div>
                                        <p>Filename: {selectedImage.name}</p>
                                        <p>Filetype: {selectedImage.type}</p>
                                        <p>Size in bytes: {selectedImage.size}</p>
                                        <p>
                                            lastModifiedDate:{' '}
                                            {selectedImage && selectedImage.lastModifiedDate.toLocaleDateString()}
                                        </p>
                                    </div>
                                ) : (
                                    <p>Select a file to show details</p>
                                )}
                            </div>
                            <div className="form-group mt-3 ">
                                <button type="submit" className="btn btn-primary btn-block"> Add Artist</button>
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
    </div>
    )
};

export default AddArtist;