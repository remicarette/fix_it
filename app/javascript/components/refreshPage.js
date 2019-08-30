const reload = () => {
  document.location.reload(true)
}

const getChatbox = () => {
  const chatbox = document.getElementById('chatbox');
  if (chatbox !== null) {
    // window.setInterval(reload, 10000);
  }
}


export { getChatbox };
