import React from "react";
import "../../assets/icons.svg"
export const Icon = ({ name, color, size } : any) => {
    return (
        <svg xmlns="http://www.w3.org/2000/svg"
    xmlnsXlink="http://www.w3.org/1999/xlink"
            className={`icon icon-${name}`}
        >
            <use xlinkHref={`#icons_${name}`} />
        </svg>
    )
}

export default Icon