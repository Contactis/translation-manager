# require build config
config = require '../variables'

gulp    = require 'gulp'
uglify  = require 'gulp-uglify'
concat  = require 'gulp-concat'
gulpif  = require 'gulp-if'

jsFiles = config.build.vendor_files.js

appFiles = [
  config.prod.buildAnnotated + '/app/**/*.js'
  config.prod.buildAnnotated + '/common/**/*.js'
  config.prod.buildAnnotated + '/' + config.build.tpl_name
]

jsFiles = jsFiles.concat appFiles

gulp.task 'build-js', ->
  gulp.src jsFiles
  .pipe(concat(config.pkg.name + '-' + config.pkg.version + '.js'))
  .pipe(gulp.dest(config.buildDir))



