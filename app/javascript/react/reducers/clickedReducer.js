const clickedReducer = (state, action) => {
  if (state === undefined) {
    return false;
  }

  switch (action.type) {
    case 'UNCLIKED':
      return action.payload;
    default:
      return state;
  }
}

export default clickedReducer;