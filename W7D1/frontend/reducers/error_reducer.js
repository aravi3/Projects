import merge from 'lodash/merge';

import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';
const initialState = [];

export const errorReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_ERRORS:
      newState = [];
      //errors return in an array form
      action.errors.forEach(error => newState.push(error));
      return newState;
    case CLEAR_ERRORS:
      return initialState;
    default:
      return state;
  }
};
