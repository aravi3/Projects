export const RECEIVE_ERRORS = "RECEIVE_ERRORS";
export const CLEAR_ERRORS = "CLEAR_ERRORS";

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors //this will be passed in from err.responseJSON from middleware dispatch
});


export const clearErrors = () => ({
  type: CLEAR_ERRORS
});
