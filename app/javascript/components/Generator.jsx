import React from 'react';
import { GeneratorCard } from "./GeneratorCard";

export const Generator = ({generators}) => (
  <div className="container">
    {generators.map(generator => (
      <GeneratorCard generator={generator}/>
    ))}
  </div>
)