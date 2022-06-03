import React, { useState, useEffect } from 'react'
import { Formik, Field, Form, ErrorMessage, useFormikContext } from "formik";
import * as Yup from "yup";
import { useAppSelector, useAppDispatch } from "../../../app/hooks";
import { clearMessage } from "../../../slices/message"
import { createArtist } from "../../../slices/artist";
import { uploadFile } from "../../../slices/uploadFile";
import { useNavigate } from 'react-router-dom';
import { selectVideoById, useUpdateVideoMutation, useGetVideoQuery } from '../../../slices/video';
import { useParams } from 'react-router-dom';

const EditVideo = (props: any) => {
    const [loading, setLoading] = useState(false);
    const { isLoggedIn } = useAppSelector((sate: any) => sate.auth)
    const { message } = useAppSelector((state: any) => state.message);
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
    const videoId = useParams<{ id: any }>();
    const { data: video, error, isLoading } = useGetVideoQuery(videoId.id)

    const [updateVideo] = useUpdateVideoMutation();
    const initialValue = {
        id: "",
        title: "",
        artiste_id: "",
        url: "",
        image: "",
        updatedAt: "" ,
        updatedBy: "",
    }
    const [currentVideo, setCurrentVideo] = useState(initialValue);



    useEffect(() => {
        dispatch(clearMessage())
    }, [dispatch])


    useEffect(()=> {
        setCurrentVideo(video?.data[0])

    },[video] )
   

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

    const handleInputChange = (event: any) => {
        const { name, value } = event?.target;
        setCurrentVideo({ ...currentVideo, [name]: value })
        console.log(currentVideo)
    }

    const handleUpdateVideo = async () => {
       
       
        setLoading(true);
        handleFileUpload();

        setCurrentVideo({...currentVideo, 
            updatedAt: new Date().toLocaleDateString('en-US'), 
            updatedBy: user.id,
            url: fileUrl,
            image: imageUrl
         })
       
      await updateVideo(currentVideo).unwrap()
            .then(() => {

                navigate('/home')
                window.location.reload();
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



    return (
        <div className="col-md-12 login-form">
            {console.log(video?.data)}
            <div className="card card-container">

                <Formik
                    initialValues={initialValue}
                    onChange={changeHandler}
                    onSubmit={handleUpdateVideo}>
                    <Form>
                        <div className="form-group">
                            <label htmlFor="title">Title</label>
                            <Field 
                            name="title" 
                            type="text" 
                            className="form-control" 
                            onChange={handleInputChange}
                            value={currentVideo?.title ?? ""} />
                            <ErrorMessage name="title" component="div" className="alert alert-danger" />
                        </div>
                        <Field name="id" type="hidden" className="form-control" value={currentVideo?.id ?? ""} />
                        <div className="form-group">
                            <label htmlFor="artiste_id">Artist</label>
                            <Field
                             name="artiste_id"
                             type="text"
                             className="form-control" 
                             value={currentVideo?.artiste_id ?? ""} />
                            <ErrorMessage name="artiste_id" component="div" className=" alert alert-danger" />
                        </div>
                        {/* <div className="form-group">
                        <label htmlFor="year">Année</label>
                        <Field name="year" type="date" className="form-control"/>
                        <ErrorMessage name="year" component="div" className=" alert alert-danger"/>
                    </div> */}

                        <div className="form-group">
                            <label htmlFor="url">Vidéo</label>
                            <Field 
                            name="url" 
                            type="file" 
                            onChange={ 
                                (e: any) => {
                                    changeHandler(e); 
                                    handleInputChange(e) }} 
                            className="form-control" />

                            <ErrorMessage name="url" component="div" className=" alert alert-danger" />
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
                            <img
                                src={`http://localhost/diabaraServer${currentVideo?.image} ?? ""`}
                                alt="profile-img"
                                className="profile-img-card"
                            />

                            <Field 
                            name="image" 
                            type="file" 
                            onChange={ 
                                (e: any) => {
                                    changeHandler(e); 
                                    handleInputChange(e) }}  
                            className="form-control" />

                            <ErrorMessage name="image" component="div" className=" alert alert-danger" />
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
                            <button type="submit" className="btn btn-primary btn-block"> Update video</button>
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
    )
}

export default EditVideo