# Twitter module
((SocialFeed, root) ->
  root.TwitterModule = SocialFeed.Modules.extend(
    url: ->
      
      # Heroku host for node-serverside.js
      # ident is here is count.
      "http://danjuls-twitfeed.herokuapp.com/?count=" + (@ident or 10)

    orderBy: (item) ->
      -Math.round((new Date(item.created_at)).getTime() / 1000)

    render: (item) ->
      html = "<p>" + item.text + "</p>"
      "<div class=\"feed-item twitter\"><i class=\"icon-twitter-1\"></i>" + html + "</div>"
  )
) SocialFeed, window