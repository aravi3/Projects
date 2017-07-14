import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from "../actions/todo_actions";
import merge from 'lodash/merge';

const initialState = {
  // 1: {
  //   id: 1,
  //   title: "wash car",
  //   body: "with soap",
  //   done: false
  // },
  // 2: {
  //   id: 2,
  //   title: "wash dog",
  //   body: "with shampoo",
  //   done: true
  // }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let newState;

  switch(action.type) {
    case RECEIVE_TODOS:
      newState = {};
      //todo.id will be assigned in the display component later
      action.todos.forEach(todo => {newState[todo.id] = todo;});
      return newState;
    case RECEIVE_TODO:
      // const newTodo = {[action.todo.id]: action.todo};
      newState = merge({}, state);
      //knows what todo is at the time it's dispatched
      newState[action.todo.id] = action.todo;
      return newState;
    case REMOVE_TODO:
      newState = merge({}, state);
      delete newState[action.todo.id];
      return newState;
    default:
      return state;
  }
};

// The first one will receive todos and populate the store, and the second one will receive a single todo and add or update a single todo.

export default todosReducer;
