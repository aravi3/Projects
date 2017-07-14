import { RECEIVE_ALL_POKEMON,
         RECEIVE_POKE
       } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const initialState = {entities: {}, currentPoke: -1};
//const initialState = {entities: {}, currentPoke: -1, items: []};


const pokemonReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState;

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = merge({}, state);
      newState.entities = action.pokemon;
      return newState;
    case RECEIVE_POKE:
      newState = merge({}, state);
      newState.entities[action.poke.id] = action.poke;
      newState.currentPoke = action.poke.id;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
