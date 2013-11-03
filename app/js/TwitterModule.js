// Twitter module
;(function (SocialFeed, root) {

  root.TwitterModule = SocialFeed.Modules.extend({
    url: function () {
      // Heroku host for node-serverside.js
      // ident is here is count.
      return 'http://danjuls-twitfeed.herokuapp.com/?count=' + (this.ident || 3)
    }

    , orderBy: function (item) {
      return -Math.round((new Date(item.created_at)).getTime() / 1000);
    }

    , render: function (item) {
      var html = '<p>' + item.text + '</p>';
      return '<div class="feed-item twitter"><i class="icon-twitter-1"></i>' + html + '</div>';
    }
  });

})(SocialFeed, window);
