$(document).on('change', '#profile_prefecture_id', function() {
  return $.ajax({
    type: 'GET',
    url: '/profiles/get_cities',
    data: {
      prefecture_id: $(this).val()
    }
  }).done(function(data) {
    return $('.city-area').html(data);
  });
});