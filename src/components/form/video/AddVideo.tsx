import React, {useState, useEffect} from 'react'
import { Formik, Field, Form, ErrorMessage, useFormikContext } from 'formik'
import * as Yup from "yup"
import {useAppSelector, useAppDispatch} from "../../../app/hooks";
import {clearMessage} from "../../../slices/message"
import {createVideo} from "../../../slices/video"
import {uploadFile} from "../../../slices/uploadFile";
import { useNavigate } from 'react-router-dom';

const AddVideo = (props: any) => {
    const [loading, setLoading] = useState(false);
    const {isLoggedInd} = useAppSelector((sate: any) => sate.auth)
    const {message} = useAppSelector((state: any) => state.message);
    const [selectedFile, setSelectedFile] = useState<any>({})
    const [selectedImage, setSelectedImage] = useState<any>({})
    const [isFilePicked, setIsFilePicked] = useState(false);
    const [isImagePicked, setIsImagePicked] = useState(false);
    const [fileUrl, setFileUrl] = useState<any>();
    const [imageUrl, setImageUrl] = useState<any>();
    const dispatch = useAppDispatch();
    const formikProps = useFormikContext()
    const navigate = useNavigate();
    const user = JSON.parse(localStorage.getItem('user')!)

    useEffect(() => {
        dispatch(clearMessage())

    }, [dispatch])

    const initialValue = {
        title: "",
        artiste_id: "",
        url: "",
        image: "",
        createdAt: "",
        createdBy: ""
    }


    const validationSchema = Yup.object().shape({
        title: Yup.string().required("this field is required!"),
        artiste_id: Yup.string().required("This field is required!"),
       
    });

    const changeHandler = (event: any) => {
        console.log(event.target.files[0].type)
        if (event.target.files[0].size >= 100000000) {

            alert("file too big")
        } else {
            if (event.target.files[0].name.match(/.(jpg|jpeg|png|gif)$/i)) {
                setSelectedImage(event.target.files[0]);
                setIsImagePicked(true);
                setImageUrl('/uploads/' + event.target.files[0].name)
            } else {

                setSelectedFile(event.target.files[0]);
                setIsFilePicked(true);
                setFileUrl('/uploads/' + event.target.files[0].name)
            }


        }


    }
    const handleAddVideo = (formValue: any) => {
        formValue.url = fileUrl;
        formValue.image = imageUrl;
        formValue.createdAt = new Date();
        formValue.createdBy = user.id;

         console.log('le user',user.id)
        const {title, artiste_id, url, image, createdAt, createdBy} = formValue;
        setLoading(true);
        handleFileUpload();


        dispatch(createVideo({title, artiste_id, url, image, createdAt, createdBy}))
            .unwrap()
            .then(() => {
                navigate("/home");
                window.location.reload()
            })
            .catch(() => {
                setLoading(false);
            })

    }

    const handleFileUpload = () => {
        const formData = new FormData();
        formData.append('File', selectedFile)
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

    return (<div className="col-md-12 login-form">

        <div className="card card-container">
            <img
                src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"
                alt="profile-img"
                className="profile-img-card"
            />

            <Formik
                initialValues={initialValue}
                validationSchema={validationSchema}
                onSubmit={handleAddVideo}>
                <Form>
                    <div className="form-group">
                        <label htmlFor="title">Title</label>
                        <Field name="title" type="text" className="form-control"/>
                        <ErrorMessage name="title" component="div" className="alert alert-danger"/>
                    </div>
                    <div className="form-group">
                        <label htmlFor="artiste_id">Artist</label>
                        <Field name="artiste_id" type="text" className="form-control"/>
                        <ErrorMessage name="artiste_id" component="div" className=" alert alert-danger"/>
                    </div>
                    {/* <div className="form-group">
                        <label htmlFor="year">Année</label>
                        <Field name="year" type="date" className="form-control"/>
                        <ErrorMessage name="year" component="div" className=" alert alert-danger"/>
                    </div> */}
                   
                    <div className="form-group">
                        <label htmlFor="url">Vidéo</label>
                        <Field name="url" type="file"  onChange={changeHandler} className="form-control"/>

                        <ErrorMessage name="url" component="div" className=" alert alert-danger"/>
                        {isFilePicked ? (
                            <div>
                                <p>Filename: {selectedFile.name}</p>
                                <p>Filetype: {selectedFile.type}</p>
                                <p>Size in bytes: {selectedFile.size}</p>
                                <p>
                                    lastModifiedDate:{' '}
                                    {selectedFile.lastModifiedDate.toLocaleDateString()}
                                </p>
                            </div>
                        ) : (
                            <p>Select a file to show details</p>
                        )}
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
                        <button type="submit" className="btn btn-primary btn-block"> Add song</button>
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
    </div>)
}
export default AddVideo