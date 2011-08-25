(function() {
  var exports;
  exports = module.exports = function(api_key) {
    var core, facebook, google_buzz, libxmljs, twitter, video, website;
    core = require('./core')(api_key);
    libxmljs = require('libxmljs');
    website = function(id, page, callback) {
      var page_number, params;
      page_number = page != null ? page : {
        page: 0
      };
      params = {
        profile_id: id,
        page_number: page_number
      };
      return core.callApi('website', 'mentions', params, null, function(err, data, status) {
        if (status === 200) {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    video = function(id, page, callback) {
      var page_number, params;
      page_number = page != null ? page : {
        page: 0
      };
      params = {
        profile_id: id,
        page_number: page_number
      };
      return core.callApi('video', 'mentions', params, null, function(err, data, status) {
        if (status === 200) {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    twitter = function(id, page, callback) {
      var page_number, params;
      page_number = page != null ? page : {
        page: 0
      };
      params = {
        profile_id: id,
        page_number: page_number
      };
      return core.callApi('twitter', 'mentions', params, null, function(err, data, status) {
        if (status === 200) {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    facebook = function(id, page, callback) {
      var page_number, params;
      page_number = page != null ? page : {
        page: 0
      };
      params = {
        profile_id: id,
        page_number: page_number
      };
      return core.callApi('facebook', 'mentions', params, null, function(err, data, status) {
        if (status === 200) {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    google_buzz = function(id, page, callback) {
      var page_number, params;
      page_number = page != null ? page : {
        page: 0
      };
      params = {
        profile_id: id,
        page_number: page_number
      };
      return core.callApi('google_buzz', 'mentions', params, null, function(err, data, status) {
        if (status === 200) {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    return {
      website: website,
      video: video,
      facebook: facebook,
      twitter: twitter,
      google_buzz: google_buzz
    };
  };
}).call(this);
