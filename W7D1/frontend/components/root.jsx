import React from 'react';
import {Provider} from 'react-redux';
import App from './app';

//receives store as prop and returns a block of jsx code
const Root = ({ store }) => (
  <Provider store= { store }>
    <App />
  </Provider>
);

export default Root;
