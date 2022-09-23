$(document).on('change', '#memo_mountain_id', function() {
  $.get('/memos/get_courses', { mountain_id: $(this).val() })
    .done(function(data) {
      $('.course-area').html(data);
    });
});