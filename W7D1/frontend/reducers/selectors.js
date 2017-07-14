
// transform an object filled with todos, into an array for easy consumption by our components.
//deconstruct all state.todos with {todos}
const allTodos = ({todos}) => {
  const ids = Object.keys(todos);
  return ids.map(id => {return todos[id];});
};

export default allTodos;
