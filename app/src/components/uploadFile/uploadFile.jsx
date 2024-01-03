import React, {useRef, useState} from 'react'
import './upload.css'


const uploadFile = () => {
    const [currentFile, setCurrentFile] = useState();
     const [fileInfo, setFileInfo] = useState("");
     const inputRef = useRef(null);

     const upload = ()=>{
      const formData = new FormData();
      formData.append('csv file', currentFile, currentFile.name )

     }

  return (
    <div className='container'>
      <div className='btn-upload' >
      <input type="file" ref={inputRef} hidden onChange={()=> {}} /> 
        <button onClick={()=> inputRef.current.click()} > + </button>
      </div>
      <div>
        <button><i class="fa-solid fa-download"></i></button>
      </div>
    </div>
  )
}

export default uploadFile