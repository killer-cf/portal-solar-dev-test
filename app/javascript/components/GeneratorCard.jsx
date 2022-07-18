import React from "react"

export const GeneratorCard = ({generator}) => (
  <div className="box card power_generator-card">
    <img src={generator.image_url} alt={generator.name}></img>
    <div className="power_generator-card__body">
      <h2>{generator.name}</h2>
      <p className="power_generator-card__price">{generator.price}</p>
      <p><strong>Descrição: </strong>{generator.description}</p>
    </div>
  </div>
)