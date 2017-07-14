import merge from 'lodash/merge';

import { RECEIVE_ITEMS } from '../actions/pokemon_actions';

const initialState = [];
//const initialState = {entities: {}, currentPoke: -1, items: []};

const itemsReducer = (state = initialState, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_ITEMS:
      //return merge({}, initialState, {items: action.items});
      return action.items;
    default:
      return state;
  }
};

export default itemsReducer;
