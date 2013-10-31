$ ->
  (->
    new SocialFeed(el: $("#socialfeed")).addModule(new TwitterModule()).addModule(new InstagramModule('43653951')).start()
  )()
