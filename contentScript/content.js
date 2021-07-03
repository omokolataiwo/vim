var actualCode = '(' + function() {
    // All code is executed in a local scope.
    // For example, the following does NOT overwrite the global `alert` method
    var alert = null;
    // To overwrite a global variable, prefix `window`:

function socialProCopyToClipboard(post) {
  navigator.clipboard.writeText(post).then(function() {
    console.log('Async: Copying to clipboard was successful!')
  }, function(err) {
    console.error('Async: Could not copy text: ', err)
  })
}
  window.console.info = (...message) => {
    socialProCopyToClipboard(JSON.stringify(message));
    Notification.requestPermission();
    new Notification('Completed.');
    };
} + ')();';
var script = document.createElement('script');
script.textContent = actualCode;
(document.head||document.documentElement).appendChild(script);