import React, { useEffect } from "react";
import { useReducer } from "react";

const inputReducer = (state, action) => {
  switch (action.type) {
    case "CHANGE":
      return { ...state, value: action.val };
    default:
      return state;
  }
};

const Input = (props) => {
  const [inputState, dispatch] = useReducer(inputReducer, { value: "" });

  const { value } = inputState;
  const { id, onInput, name, type, element, placeholder, label, userRef } =
    props;

  useEffect(() => {
    onInput(id, value);
  }, [id, onInput, value]);
  const changeHandler = (event) => {
    dispatch({ type: "CHANGE", val: event.target.value });
  };

  const el =
    element === "input" ? (
      <>
        <label for="first_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{name}</label>
        <input type="text" id="first_name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder={name} required value={props.value} />
      </>

    ) : (
      <textarea
        name={name}
        rows="4"
        onChange={changeHandler}
        value={inputState.value}
        ref={ref}
      />
    );

  return (
    <div className="mb-4">
      <label
        htmlFor={id}
        className="block text-gray-700 text-sm font-bold mb-2"
      >
        {" "}
        {label}{" "}
      </label>
      {el}
    </div>
  );
};

export default Input;
