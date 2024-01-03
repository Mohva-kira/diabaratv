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
      <input
        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        type={type}
        onChange={changeHandler}
        value={inputState.value}
        name={name}
        placeholder={placeholder}
        ref={userRef}
      />
    ): (
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
