document.addEventListener('DOMContentLoaded', function() {
  // Function to hide flash messages after a certain time
  function hideFlashMessages() {
    var flashMessages = document.querySelectorAll('.alert, .notice');

    flashMessages.forEach(function(message) {
      setTimeout(function() {
        message.style.display = 'none';
      }, 4000); // Adjust the time in milliseconds (e.g., 5000 for 5 seconds)
    });
  }

  // Call the function on page load
  hideFlashMessages();
});
