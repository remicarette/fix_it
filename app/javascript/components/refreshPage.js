const reload = () => {
  document.location.reload(true)
}

const getChatbox = () => {
  const chatbox = document.getElementById('chatbox');
  if (chatbox !== null) {
    window.setInterval(reload, 5000);
  }
}


export { getChatbox };
