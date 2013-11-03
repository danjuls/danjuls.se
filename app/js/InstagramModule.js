// Instagram module
var InstagramModule = SocialFeed.Modules.extend({
  init: function(ident) {
    // Constructor. Omit to use default one with only "ident".
    this.ident = ident;

  }

  , url: function () {
    // URL can also be a string, but having it as a function
    // allows us to pass the ident value. ident is the first argument
    // to the module constructor.
    // return 'http://path.to.some/document.json?user=' + this.ident + '&count=' + this.count;
    return 'https://api.instagram.com/v1/users/'+this.ident+'/media/recent/?access_token=43653951.e3c328e.510098d4ec5b4e6a9845367d7023dabf&count=3';
  }

  , parse: function (resp) {

    // resp is the response from the AJAX call. Return a list of entities.
    return resp.data;
  }

  , orderBy: function (item) {
    // orderBy must be implemented. Return a numeric value to sort by.
    // item is an entity from the results.
    return -item.created_time;
  }

  , render: function (item) {
    // Return HTML representation of an entity.
    return '<div class="feed-item instagram"><i class="icon-instagram"></i><img src="' + item.images.standard_resolution.url + '" /><div>';
  }
});
