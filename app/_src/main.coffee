$ ->
  (->
    new SocialFeed(el: $("#socialfeed")).addModule(new TwitterModule()).addModule(new InstagramModule('43653951')).start()
  )()

  $(window).setBreakpoints

    # use only largest available vs use all available
    distinct: true

    # array of widths in pixels where breakpoints
    # should be triggered
    breakpoints: [768]

  $(window).bind "enterBreakpoint768", ->
    $("#pages").jmpress
      start: "#title"
      stepSelector: ".page"
      fullscreen: true
      # transitionDuration: duration
      # animation:
      #   transitionDuration: duration / 1000 + "s"

      # mouse:
      #   clickSelects: false

      idle: ->

        # setCurrentMenuItem();
        # refreshScrollBars()


      # beforeChange : function( element, eventData ) {
      #   var activePage = $(element[0]);
      #   if(activePage.hasClass('resume')) {
      #     animateBars();
      #     }
      #   },
      setActive: (element, eventData) ->
        activePage = $(element[0])
        if activePage.attr("id") isnt "title"
          $("h2.caption span").empty().append(activePage.attr("id")).show "slow"
          $("h2.caption span").removeClass().addClass activePage.attr("id")
        else
          $("h2.caption span").hide().removeClass()

