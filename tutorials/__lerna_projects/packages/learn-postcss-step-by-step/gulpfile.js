var gulp = require("gulp");

gulp.task("build", function() {
  return gulp
    .src("./css/app.css")

    .pipe(gulp.dest("./dist"));
});
