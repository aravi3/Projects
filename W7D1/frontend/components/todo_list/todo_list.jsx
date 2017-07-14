import React from 'react';
import TodoListItem from './todo_list_item';
import TodoListForm from './todo_form';


// params == mapStatetoProps
// TodoListItem == pass in todo as item and attach receiveTodo & removeTodo function
// const TodoList = ({ todos, receiveTodo, removeTodo, fetchTodos }) => (
//   <div>
//     <ul>
//       {todos.map((todo, idx) => <TodoListItem receiveTodo={receiveTodo} removeTodo={removeTodo} key={idx} item={todo}/>)}
//     </ul>
//     <TodoListForm receiveTodo={receiveTodo} />
//   </div>
// );

class TodoList extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  componentDidMount() {
    // DidMount gets triggered automatically whenever new props are passed in aka whenever a page needs to be reloaded
    this.props.fetchTodos();
  }

  render() {
    let {todos, receiveTodo, removeTodo, fetchTodos, createTodo, errors} = this.props;
    return (
      <div>
        <ul>
          {todos.map((todo, idx) => <TodoListItem receiveTodo={receiveTodo} removeTodo={removeTodo} key={idx} item={todo}/>)}
        </ul>
        <TodoListForm errors={errors} createTodo={createTodo} />
      </div>
    );
  }
}

export default TodoList;
