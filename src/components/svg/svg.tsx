import React from "react";

import 'bootstrap-icons/bootstrap-icons.svg'
import '../../assets/icons.svg'


export const Icon = ({ name, color, size } : any) => {
    return (
        <svg xmlns="http://www.w3.org/2000/svg"
    xmlnsXlink="http://www.w3.org/1999/xlink"
            className={`icon icon-${name}`}
             fill={color}
             width={size}
             height={size}
        >
            <use xlinkHref={`#bootstrap-icons_${name}`} />
        </svg>
    )
}

export default Icon