var gulp = require('gulp');
var styleguide = require('sc5-styleguide');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');
var surge = require('gulp-surge');
var outputPath = 'styleguide';
var source = './app/assets/stylesheets/**/*.scss';

gulp.task('styleguide:generate', function() {
  return gulp.src(source)
    .pipe(styleguide.generate({
        title: 'Bitcoinocracy Styleguide',
        server: true,
        rootPath: outputPath,
        overviewPath: 'README.md',
        port: 3500,
        disableHtml5Mode: true
      }))
    .pipe(gulp.dest(outputPath));
});

gulp.task('styleguide:applystyles', function() {
  return gulp.src('./app/assets/stylesheets/**/*.scss')
    .pipe(sass({
      errorLogToConsole: true,
      includePaths: 'app/assets/stylesheets/'
    }))
    .pipe(autoprefixer({
      browsers: [
        '> 1%',
        'last 2 versions',
        'firefox >= 4',
        'safari 7',
        'safari 8',
        'IE 8',
        'IE 9',
        'IE 10',
        'IE 11'
      ],
      cascade: false
    }))
    .pipe(styleguide.applyStyles())
    .pipe(gulp.dest(outputPath));
});

gulp.task('styleguide:build', ['styleguide:generate', 'styleguide:applystyles']);

gulp.task('styleguide:watch', ['styleguide:build'], function () {
    console.log('View the styleguide in your browser under http://localhost:3500/');
    // Start watching changes and update styleguide whenever changes are detected
    // Styleguide automatically detects existing server instance
    gulp.watch(['app/assets/stylesheets/**/*.scss'], ['styleguide:build']);
});

gulp.task('styleguide:deploy', ['styleguide:build'], function () {
  return surge({
    project: './styleguide',
    domain: 'bitcoinocracy-styleguide.surge.sh'
  })
})
