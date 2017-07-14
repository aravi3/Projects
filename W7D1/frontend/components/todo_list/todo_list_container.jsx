import { connect } from 'react-redux';
import TodoList from './todo_list';

// ACTIONS
import { receiveTodos, createTodo, removeTodo, fetchTodos, receiveTodo } from  '../../actions/todo_actions';
import allTodos from '../../reducers/selectors';

const mapStateToProps = (state) => ({
  // todos is a prop
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)), //must delete after changing update done/undone in form
  createTodo: (todo) => dispatch(createTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
