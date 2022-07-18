import React, { useState, useCallback, useEffect } from 'react';
import { loadGenerators } from '../utils/load_generators';
import { Button } from './Button';
import { Generator } from './Generator';

export const Generators = () => {
  const [generators, setGenerators] = useState([])
  const [allGenerators, setAllGenerators] = useState([])
  const [page, setPage] = useState(0);
  const [generatorsPerPage] = useState(6);
  const [searchValue, setSearchValue] = useState('');

  const handleLoadGenerators = useCallback(async (page, generatorsPerPage) => {
    let generators = await loadGenerators();

    setGenerators(generators.slice(page, generatorsPerPage));
    setAllGenerators(generators);
  }, []);

  useEffect(() => {
    handleLoadGenerators(0, generatorsPerPage);
  }, [handleLoadGenerators, generatorsPerPage]);

  const loadMoreGenerators = () => {
    const nextPage = page + generatorsPerPage;
    const nextGenerators = allGenerators.slice(nextPage, nextPage + generatorsPerPage);
    generators.push(...nextGenerators);

    setGenerators(generators);
    setPage(nextPage);
  }

  const handleChange = (e) => {
    const { value } = e.target;
    setSearchValue(value);
  }

  const noMoreGenerators = page + generatorsPerPage >= allGenerators.length;
  const filteredGenerators = !!searchValue ?
    allGenerators.filter(generators => {
      return generators.title.toLowerCase().includes(
        searchValue.toLowerCase()
      );
    })
    : generators;

  return (
    <div>
      {!!searchValue && (
          <h1>Search value: {searchValue}</h1>
        )}

      <input type='text' onChange={handleChange} value={searchValue} />

      {filteredGenerators.length > 0 && (
        <Generator generators={filteredGenerators} />
      )}

      {filteredGenerators.length === 0 && (
        <p>Não existem posts</p>
      )}

      {!searchValue && (
          <Button
            title="Carregar mais..."
            onClick={loadMoreGenerators}
            disabled={noMoreGenerators}
          />
        )}
    </div>
  )
}