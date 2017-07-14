import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import selectors from './reducers/selectors';
import {fetchTodos} from './actions/todo_actions';
import App from './components/app';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  // const preloadedState = localStorage.state ?
  //   JSON.parse(localStorage.state) : {};
  // const store = configureStore(preloadedState);
  const store = configureStore();

  window.store = store;
  window.fetchTodos = fetchTodos;

  const root = document.getElementById('content');
  // ReactDOM.render(<Root store={store} />, root);
  ReactDOM.render(<Root store={store} />, root);
});
