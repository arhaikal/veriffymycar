// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var veriff = Veriff({
  env: 'production', // or 'staging'
  apiKey: 'API_KEY',
  parentId: 'veriff-root',
  onSession: function(err, response) {
    // received the response, verification can be started now
  }
});
veriff.mount();