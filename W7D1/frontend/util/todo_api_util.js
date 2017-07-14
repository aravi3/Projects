const requestAPItodo = () => {
  return $.ajax( {method: 'GET', url: '/api/todos' });
};


export default requestAPItodo;
