$(document).on('turbo:load', function() {
  $('#toggle-articles-btn').click(function() {
    $('#articles-list').toggle(); // Show/Hide articles list
    // Optionally change button label for UX
    if ($('#articles-list').is(':visible')) {
      $(this).text('Hide Articles List');
    } else {
      $(this).text('Show Articles List');
    }
  });
});