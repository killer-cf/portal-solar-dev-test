import React from 'react'

export const Button = ({title, onClick, disabled}) => {
  return (
    <div className="button-container">
      <button
        disabled={disabled}
        onClick={onClick}>{title}
      </button>
    </div>
  )
}