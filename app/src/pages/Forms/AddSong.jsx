import React,{useState, useRef, useEffect} from 'react'
import { useNavigate } from 'react-router-dom'

import { useDispatch } from 'react-redux'
import { setCredentials } from '../../redux/features/auth/authSlice'

import { useForm } from '../../components/hook/form-hook'
import Input from "../../components/Input"
// import { useLoginMutation, useAddUserMutation } from '../../redux/features/auth/authApiSlice'
import { useAddSongMutation } from '../../redux/services/songsApi'

const AddSong = () => {

    const userRef = useRef()
    const errRef = useRef()
    const [errMsg, setErrMsg] = useState('')
    const navigate = useNavigate()
    const dispatch = useDispatch()
    const [selectedFile, setSelectedFile] = useState(null)
    
     const [formState, inputHandler, setFormData] = useForm({
        phone: {value: ''}, password: {value: ''}
    })


    const [addNewSong, { isLoading }] = useAddSongMutation()


    const onFileChange = event => {
     setSelectedFile(event.target.files[0])
    }




    const submitHandler = async (event) => {
        
        event.preventDefault()
        console.log(JSON.stringify(formState.inputs))
        console.log(selectedFile)
        const formData = new FormData()

        formData.append('file', selectedFile)
        console.log('form data', formData)


    
        try {
            
         await addNewSong(formData)
                .unwrap()
                .then((response) => {
                    console.log('connected', response)
                    dispatch(setCredentials(response))
                  
                })
                

                
        
            
        } catch (error) {
            console.log(error)

            if(!error?.response) {
                setErrMsg('No Server Response');

            } else if (error?.response?.status === 400) {
                setErrMsg('Missing Username or Password')
            } else if (error?.response?.status === 401) {
                setErrMsg('Unauthorized')
            }else{
                setErrMsg('Login Failed')
            }

            errRef.current.focus()
        }

    }

    useEffect(() => {
      userRef.current.focus()
    
    
    }, [])

    useEffect(() => {
      setErrMsg('')
    
     
    }, [formState.inputs])

  return (
    <div className='w-full grid h-screen place-items-center'>
    <p ref={errRef} className={errMsg ? "bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" : "offscreen"} aria-live="assertive">{errMsg}</p>
        <form onSubmit={submitHandler} className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            
            <Input element="input" userRef={userRef} id="title" type="text" label="Title" onInput={inputHandler} />
                
            

            <Input element="input" userRef={userRef} id="artist" type="number" label="Artist" onInput={inputHandler} />

            <Input element="input" id="year" type="date" label="Year" onInput={inputHandler} />
            <Input element="input" id="image" type="file" label="Image" onInput={inputHandler} />
            <input element="input" id="song" type="file" onChange={onFileChange} label="Song"  />
            <Input element="input" id="album_name" type="text" label="Album name" onInput={inputHandler} />
            <Input element="input" id="country" type="text" label="Country" onInput={inputHandler} />
            <Input element="input" id="genre" type="date" label="Genre" onInput={inputHandler} />
         

            <div className="flex items-center justify-between">
             <button className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit"> {'SIGNUP'}  </button>
             <button className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button" >  { 'LOGIN'} </button>
             </div>
        </form>
    </div>
  )
}

export default AddSong