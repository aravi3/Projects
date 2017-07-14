import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.remove = this.remove.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  remove(item) {
    return () => this.props.removeTodo(item);
  }

  updateTodo(item) {
    let newItem = merge({}, item);
    //.done is property of to do
    newItem.done = !newItem.done;
    return () => this.props.receiveTodo(newItem);
  }

  render() {
    return (
      <li>
        {this.props.item.title}
        &nbsp;
        <button onClick={this.remove(this.props.item)}>Delete</button>
        &nbsp;
        <button onClick={this.updateTodo(this.props.item)}>{this.props.item.done ? "done" : "undone"}</button>
      </li>
    );
  }
}

export default TodoListItem;
