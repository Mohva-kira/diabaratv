import React, { useEffect, useRef, useState } from 'react'
import { Formik, Field, Form, ErrorMessage, useFormikContext } from "formik";
import * as Yup from "yup";
import { useAppSelector } from '../../../app/hooks';
import { useAddPlaylistMutation, useAddToPlaylistMutation } from '../../../slices/playlist';
import { useNavigate } from 'react-router-dom';
import { useGetPlaylistSongsQuery } from '../../../slices/playlistSongs';
import { useRemoveFromPlaylistMutation } from '../../../slices/playlistSongs';
import song from '../../../slices/song';

const AddToPlaylist = (props: any) => {
    const [loading, setLoading] = useState(false);
    const { user: currentUser } = useAppSelector((state: any) => state.auth);
    const [addPlaylist] = useAddPlaylistMutation();
    const [addToPlaylist] = useAddToPlaylistMutation();
    const [removeFromPlyalist] = useRemoveFromPlaylistMutation();
    const [playlist, setPlaylist] = useState<any>();
    const { data: playlistSongs, isLoading, isError, isFetching, refetch } = useGetPlaylistSongsQuery(props.song.id)
    const history = useNavigate();
    const formikRef = useRef<any>();
    const initialValues = {
        id: "",
        songId: "",
    }


    const handleSubmit = async (formValue: any) => {
        setLoading(true)
        formValue.songId = props.song.id;
        formValue.id = playlist.id;

        const { id, songId } = formValue;

        await addToPlaylist({ id, songId })
            .unwrap()
            .then(() => {
                refetch()
                setLoading(false);
            })


    }

    const handleRemove = async (data: any) => {
        setLoading(true)

        await removeFromPlyalist(data)
            .unwrap()
            .then(() => {

                refetch()
                setLoading(false);
            }

            )


    }

    const handleCheck = (data: any, event: any) => {
        setPlaylist(data);
        if (event.target.checked) {
            //remove song from playlist
            console.log('yesss')
            formikRef.current.submitForm();



        } else {
            console.log('out')
            //add song to playlist
            handleRemove(playlistSongs.data.find((song: any) => song.playlist_id == data.id && props.song.id == song.song_id))
        }
    }

    useEffect(() => {

    }, [handleRemove, handleSubmit])

    return (
        <div className="justify-content-center">
            <> {console.log(formikRef)}</>
            <Formik
                initialValues={initialValues}
                onSubmit={handleSubmit}
                innerRef={formikRef}  >
                <Form>
                    <div className="form-group">
                        <ul>
                            <div role="group" aria-labelledby="checkbox-group">

                                {props.playlists.map((item: any, i: any) => (
                                    <li key={i} className="d-flex justify-content-center align-items-center">
                                        {playlistSongs ?
                                            <>
                                                <div className="form-check form-switch">
                                                    <Field type="checkbox" name="checked" value={item.name} className="form-check-input"
                                                        checked={playlistSongs ? playlistSongs.data.find((song: any) => song.playlist_id == item.id && song.song_id == props.song.id) : false}
                                                        onClick={(e: any) => { handleCheck(item, e) }} id="playlist" />
                                                    <label className='form-check-label mt-0' htmlFor="playlist"> {item.name}  </label>
                                                </div>
                                            </>


                                            : <>
                                              <div className="form-check form-switch">
                                                <Field type="checkbox" name="checked" value={item.name} className="form-check-input mx-2" onChange={(e: any) => { handleCheck(item, e) }} />
                                                <label className='form-check-label mt-0'> {item.name}  </label>
                                                </div>
                                            </>}
                                    </li>
                                ))

                                }
                                {loading && (
                                    <span className="spinner-border spinner-border-sm"></span>
                                )}
                            </div>
                        </ul>
                    </div>


                </Form>
            </Formik>

        </div>
    )
}

export default AddToPlaylist