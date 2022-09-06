$(document).on('change', '#memo_mountain_id', function() {
  return $.ajax({
    type: 'GET',
    url: '/memos/get_courses',
    data: {
      prefecture_id: $(this).val()
    }
  }).done(function(data) {
    return $('.course-area').html(data);
  });
});