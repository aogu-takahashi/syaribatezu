(() => {
  // app/javascript/get_courses.js
  $(document).on("change", "#memo_mountain_id", function() {
    $.get("/memos/get_courses", { mountain_id: $(this).val() }).done(function(data) {
      $(".course-area").html(data);
    });
  });
  $(document).on("change", "#mountain_id", function() {
    $.get("/courses", { mountain_id: $(this).val() }).done(function(data) {
      $(".course-area").html(data);
    });
  });
})();
//# sourceMappingURL=assets/application.js.map
