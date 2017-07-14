//responsible for combining our multiple, domain-specific reducers

import {combineReducers} from "redux";

import todosReducer from "./todos_reducer";
import {errorReducer} from "./error_reducer";

//assigns what portion of state to pass through
const rootReducer = combineReducers({
  todos: todosReducer,
  errors: errorReducer
});

export default rootReducer;
