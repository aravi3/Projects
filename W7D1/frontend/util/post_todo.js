const postTodo = (todo) => {
  return $.ajax({
    method: 'POST',
    url: '/api/todos',
    dataType: 'json',
    data: { todo: todo }
  });
};


export default postTodo;
