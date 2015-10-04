glob       = require('glob')
gulp       = require('gulp')
browserify = require('browserify')
sourcemaps = require('gulp-sourcemaps')
source     = require('vinyl-source-stream')
buffer     = require('vinyl-buffer')

gulp.task 'script', ->
  scripts = glob.sync './assets/javascripts/*.coffee'
  browserify
    transform:  ['coffeeify']
    extensions: ['.coffee']
    entries:    scripts
    debug:      true
  .bundle()
  .pipe source 'app.js'
  .pipe buffer()
  .pipe sourcemaps.init
    loadMaps: true
  .pipe sourcemaps.write()
  .pipe gulp.dest './public/js/'
