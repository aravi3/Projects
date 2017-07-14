import React from 'react';
import uniqueId from '../../util/unique_id';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.generateTodo = this.generateTodo.bind(this);
  }

  generateTodo(e) {
    e.preventDefault();
    //let id = uniqueId();
    let title = this.state.title;
    let body = this.state.body;
    let done = this.state.done;
    let obj = {title: title, body: body, done: done};
    this.props.createTodo(obj).then(
    () => {
      this.setState({ title: "", body: "" });
      });
  }

  update(property) {
    //e.target is the element your event occured on
    return e => this.setState({[property]: e.target.value});
  }

  render() {
    return(
      <form onSubmit={this.generateTodo}>
        <label>Title
          <input
            onChange={this.update('title')}
            type='text'
            value={this.state.title}/>
        </label>

        <label>Body
          <input
            onChange={this.update('body')}
            type='text'
            value={this.state.body}/>
        </label>

        <label>Done
          <input
            type='hidden'
            value={this.state.done} />
        </label>

        <h1>{this.props.errors}</h1>

        <input type='submit'></input>
      </form>
    );
  }
}

export default TodoForm;
