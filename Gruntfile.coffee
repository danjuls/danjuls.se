# Generated on 2013-10-28 using generator-jekyllrb 0.4.1
"use strict"

# Directory reference:
#   css: css
#   compass: _sass
#   javascript: js
#   coffeescript: _src
#   images: img
#   fonts: fonts
module.exports = (grunt) ->

  # Show elapsed time after tasks run
  require("time-grunt") grunt

  # Load all Grunt tasks
  require("load-grunt-tasks") grunt
  grunt.initConfig

    # Configurable paths
    yeoman:
      app: "app"
      dist: "dist"

    watch:
      compass:
        files: ["<%= yeoman.app %>/_sass/**/*.{scss,sass}"]
        tasks: ["compass:server", "autoprefixer:server"]

      autoprefixer:
        files: ["<%= yeoman.app %>/css/**/*.css"]
        tasks: ["copy:stageCss", "autoprefixer:server"]

      coffee:
        files: ["<%= yeoman.app %>/_src/**/*.coffee"]
        tasks: ["coffee:dist"]

      coffeeTest:
        files: ["test/spec/**/*.coffee"]
        tasks: ["coffee:test"]

      jekyll:
        files: ["<%= yeoman.app %>/**/*.{html,yml,md,mkd,markdown}", "_config.yml", "!<%= yeoman.app %>/_bower_components"]
        tasks: ["jekyll:server"]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"

        files: [".jekyll/**/*.html", ".tmp/css/**/*.css", "{.tmp,<%= yeoman.app %>}/<%= js %>/**/*.js", "<%= yeoman.app %>/img/**/*.{gif,jpg,jpeg,png,svg,webp}"]

    connect:
      options:
        port: 9000
        livereload: 35729

        # change this to '0.0.0.0' to access the server from outside
        hostname: "localhost"

      livereload:
        options:
          open: true
          base: [".tmp", ".jekyll", "<%= yeoman.app %>"]

      dist:
        options:
          open: true
          base: ["<%= yeoman.dist %>"]

      test:
        options:
          base: [".tmp", ".jekyll", "test", "<%= yeoman.app %>"]

    clean:
      dist:
        files: [
          dot: true

          # Running Jekyll also cleans the target directory.  Exclude any
          # non-standard `keep_files` here (e.g., the generated files
          # directory from Jekyll Picture Tag).
          src: [".tmp", "<%= yeoman.dist %>/*", "!<%= yeoman.dist %>/.git*"]
        ]

      server: [".tmp", ".jekyll"]

    compass:
      options:

        # If youre using global Sass gems, require them here.
        # require: ['singularity', 'jacket'],
        bundleExec: true
        sassDir: "<%= yeoman.app %>/_sass"
        cssDir: ".tmp/css"
        imagesDir: "<%= yeoman.app %>/img"
        javascriptsDir: "<%= yeoman.app %>/js"
        relativeAssets: false
        httpImagesPath: "/img"
        httpGeneratedImagesPath: "/img/generated"
        outputStyle: "expanded"
        raw: "extensions_dir = \"<%= yeoman.app %>/_bower_components\"\n"

      dist:
        options:
          # config: '.config.rb',
          generatedImagesDir: "<%= yeoman.dist %>/img/generated"

      server:
        options:
          debugInfo: true
          generatedImagesDir: ".tmp/img/generated"

    autoprefixer:
      options:
        browsers: ["last 2 versions"]

      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>/css"
          src: "**/*.css"
          dest: "<%= yeoman.dist %>/css"
        ]

      server:
        files: [
          expand: true
          cwd: ".tmp/css"
          src: "**/*.css"
          dest: ".tmp/css"
        ]

    coffee:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/_src"
          src: "**/*.coffee"
          dest: ".tmp/js"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "**/*.coffee"
          dest: ".tmp/spec"
          ext: ".js"
        ]

    jekyll:
      options:
        bundleExec: true
        config: "_config.yml,_config.build.yml"
        src: "<%= yeoman.app %>"

      dist:
        options:
          dest: "<%= yeoman.dist %>"

      server:
        options:
          config: "_config.yml"
          dest: ".jekyll"

      check:
        options:
          doctor: true


    # UseminPrepare will only scan a single page for usemin blocks. If you
    # use usemin blocks that arent in index.html, create a usemin manifest
    # page (hackery!) and point this task there.
    useminPrepare:
      options:
        dest: "<%= yeoman.dist %>"

      html: "<%= yeoman.dist %>/index.html"

    usemin:
      options:
        basedir: "<%= yeoman.dist %>"
        dirs: ["<%= yeoman.dist %>/**/*"]

      html: ["<%= yeoman.dist %>/**/*.html"]
      css: ["<%= yeoman.dist %>/css/**/*.css"]

    htmlmin:
      dist:
        options:
          collapseWhitespace: true
          collapseBooleanAttributes: true
          removeAttributeQuotes: true
          removeRedundantAttributes: true

        files: [
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: "**/*.html"
          dest: "<%= yeoman.dist %>"
        ]


    # Usemin adds files to concat
    concat: {}

    # Usemin adds files to uglify
    uglify: {}

    # Usemin adds files to cssmin
    cssmin:
      dist:
        options:
          check: "gzip"

    imagemin:
      dist:
        options:
          progressive: true

        files: [
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: "**/*.{jpg,jpeg,png}"
          dest: "<%= yeoman.dist %>"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: ["**/*.svg", "!fonts/**"]
          dest: "<%= yeoman.dist %>"
        ]

    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"

          # Jekyll processes and moves HTML and text files
          # Usemin moves CSS and javascript inside of Usemin blocks
          # Copy moves asset files and directories

          # Like Jekyll, exclude files & folders prefixed with an underscore
          src: ["img/**/*", "fonts/**/*", "!**/_*{,/**}"]

          # Explicitly add any files your site needs for distribution here
          #'_bower_components/jquery/jquery.js',
          #'favicon.ico',
          #'apple-touch*.png'
          dest: "<%= yeoman.dist %>"
        ]


      # Copy CSS into .tmp directory for Autoprefixer processing
      stageCss:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>/css"
          src: "**/*.css"
          dest: ".tmp/css"
        ]

    rev:
      options:
        length: 4

      dist:
        files:
          src: ["<%= yeoman.dist %>/js/**/*.js", "<%= yeoman.dist %>/css/**/*.css", "<%= yeoman.dist %>/img/**/*.{gif,jpg,jpeg,png,svg,webp}", "<%= yeoman.dist %>/fonts/**/*.{eot*,otf,svg,ttf,woff}"]

    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: ["Gruntfile.js", "<%= yeoman.app %>/js/**/*.js", "test/spec/**/*.js", "!<%= yeoman.app %>/js/vendor/**/*"]

    csscss:
      options:
        bundleExec: true
        minMatch: 2
        ignoreSassMixins: false
        compass: true
        colorize: true
        shorthand: false
        verbose: true

      check:
        src: ["<%= yeoman.app %>/css/**/*.css", "<%= yeoman.app %>/_sass/**/*.scss"]

    csslint:
      options:
        csslintrc: ".csslintrc"

      check:
        src: ["<%= yeoman.app %>}/css/**/*.css", "<%= yeoman.app %>}/_sass/**/*.scss"]

    concurrent:
      server: ["compass:server", "coffee:dist", "copy:stageCss", "jekyll:server"]
      dist: ["compass:dist", "coffee:dist", "copy:dist"]

    "bower-install":
      target:

        # Point to the html file that should be updated
        # when you run `grunt bower-install`
        html: "app/_layouts/default.html"

        # Optional:

        # If your file paths shouldnt contain a certain
        # portion of a url, it can be excluded
        ignorePath: "app/"

        # Customize how your stylesheets are included on
        # your page.
        #
        #   default: '<link rel="stylesheet" href="{{filePath}}" />'
        cssPattern: "<link href=\"{{filePath}}\" rel=\"stylesheet\">"

        # Customize how your <script>s are included into
        # your HTML file.
        #
        #   default: '<script src="{{filePath}}"></script>'
        jsPattern: "<script type=\"text/javascript\" src=\"{{filePath}}\"></script>"


  # Define Tasks
  grunt.registerTask "serve", (target) ->
    return grunt.task.run(["build", "connect:dist:keepalive"])  if target is "dist"
    grunt.task.run ["clean:server", "concurrent:server", "autoprefixer:server", "connect:livereload", "watch"]

  grunt.registerTask "server", ->
    grunt.log.warn "The `server` task has been deprecated. Use `grunt serve` to start a server."
    grunt.task.run ["serve"]


  # No real tests yet. Add your own.
  grunt.registerTask "test", []

  #   'clean:server',
  #   'concurrent:test',
  #   'connect:test'
  grunt.registerTask "check", ["clean:server", "jekyll:check", "compass:server", "coffee:dist", "jshint:all", "csscss:check", "csslint:check"]

  # Jekyll cleans files from the target directory, so must run first
  grunt.registerTask "build", ["clean:dist", "jekyll:dist", "concurrent:dist", "useminPrepare", "concat", "autoprefixer:dist", "cssmin", "uglify", "imagemin", "svgmin", "rev", "usemin", "htmlmin"]
  grunt.registerTask "default", ["check", "test", "build", "bower"]
  grunt.loadNpmTasks "grunt-bower-install"
  grunt.loadNpmTasks "grunt-contrib-coffee"
