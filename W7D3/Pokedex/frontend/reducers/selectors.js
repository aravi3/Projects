import values from 'lodash/values';

export const selectAllPokemon = state => values(state.pokemon.entities);
export const selectPoke = state => state.pokemon.entities[state.pokemon.currentPoke];
export const selectItem = (state, itemId) => state.items.filter(item => item.id === itemId)[0];
