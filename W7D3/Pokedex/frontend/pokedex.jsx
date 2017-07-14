import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { requestAllPokemon } from './actions/pokemon_actions';
import { selectAllPokemon } from './reducers/selectors.js';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

import { requestPoke } from './actions/pokemon_actions';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.requestPoke = requestPoke;
  console.log(store);
  ReactDOM.render(<Root store={store} />, rootEl);
});
