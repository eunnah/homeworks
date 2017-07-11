import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { createStore, applyMiddleware } from 'redux';
import createLogger from 'redux-logger';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  // const preloadedState = localStorage.state ?
  //   JSON.parse(localStorage.state) : {};
  // let store = configureStore(preloadedState);

  // store = applyMiddlewares(store, addLoggingToDispatch);

  const logger = createLogger();

  let store = (preloadedState = {}) => (
  createStore(
    preloadedState,
    applyMiddleware(logger)
  )
);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingToDispatch = store => next => action => {
//   // your code here
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };

// const addLoggingToDispatch = (store) => {
//   const OGDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     OGDispatch(action);
//     console.log(store.getState());
//   };
//
// };
