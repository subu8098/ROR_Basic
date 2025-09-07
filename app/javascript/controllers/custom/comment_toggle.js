$(document).on('turbo:load', function() {
  $('#toggle-comments-btn').click(function() {
    $('#comments-section').toggle();
    if ($('#comments-section').is(':visible')) {
      $(this).text('Hide Comments');
    } else {
      $(this).text('Show Comments');
    }
  });
});
