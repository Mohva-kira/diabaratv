import React from 'react'
import Input from '../components/Input'
import { useForm } from '../components/hook/form-hook'

const Contact = () => {
    const [formState, inputHandler] = useForm({
        name: {value: ''},
        email: {value: ''},
        description: {value: ''},
        address: {value: ''},
        number: {value: ''}
    })

    const submitHandler = (event) => {event.preventDefault();
        console.log(formState.inputs)
    }
  return (
    <form onSubmit={submitHandler}>
        <Input id="name" element="input" type="text" label="Name" onInput={inputHandler} />
        <Input id="email" element="input" type="e-mail" label="e-mail" onInput={inputHandler} />
        <Input id="description" element="textarea"  label="Description" onInput={inputHandler} />
        <Input id="address" element="input" type="text" label="Address" onInput={inputHandler} />
        <Input id="number" element="input" type="number" label="Number" onInput={inputHandler} />
        <button type='submit'> Submit</button>
    </form>
  )
}

export default Contact