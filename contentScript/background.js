chrome.runtime.onMessage.addListener((message) => {
  chorome.notifications.create({ message });
})