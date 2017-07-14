// first file will receive todos and populate store
//second file will receive a single to do and add or update a single todo


import requestAPItodo from '../util/todo_api_util';
import postTodo from '../util/post_todo';
import {receiveErrors, clearErrors} from './error_actions';

//create & export action types:
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO"; //current todo you're on view page
export const REMOVE_TODO = "REMOVE_TODO";


export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo
});

export const fetchTodos = () => dispatch => {
  return requestAPItodo().then(todos => dispatch(receiveTodos(todos)));
};

export const createTodo = (todo) => dispatch => {
  return postTodo(todo).then(resp => {dispatch(receiveTodo(resp)); dispatch(clearErrors());}, err => dispatch(receiveErrors(err.responseJSON)));
};

// EXAMPLE DODO
// {
//   '1': {
//     id: 1,
//     title: "wash car",
//     body: "with soap",
//     done: false
//   },
//   '2': {
//     id: 2,
//     title: "wash dog",
//     body: "with shampoo",
//     done: true
//   },
// }

//actions objs are called in components/container (when store.dispatch(action) is called)
