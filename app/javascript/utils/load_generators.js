export const loadGenerators = async () => {
  const generators = await fetch('http://localhost:3000/api/v1/power_generators')
  .then(response => response.json())
  .then(data => data); 
  return generators;
}
