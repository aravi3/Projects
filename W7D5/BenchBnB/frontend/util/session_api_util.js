export const signup = (user) => {
  return $.ajax({
    method: 'POST',
    url: '/api/users',
    dataType: 'json',
    data: {
      user: {
        username: user.username,
        password: user.password
      }
    }
  });
};

export const login = (user) => {
  return $.ajax({
    method: 'POST',
    url: '/api/session',
    dataType: 'json',
    data: {
      user: {
        username: user.username,
        password: user.password
      }
    }
  });
};

export const logout = () => {
  return $.ajax({
    method: 'DELETE',
    url: '/api/session'
  });
};
