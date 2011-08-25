(function() {
  var exports;
  exports = module.exports = function(api_key) {
    var core, facebook, google_buzz, libxmljs, twitter, video, website;
    core = require('./core')(api_key);
    libxmljs = require('libxmljs');
    video = function(id, days, callback) {
      var day_set, params;
      switch (days) {
        case 1:
        case 7:
        case 30:
          day_set = days;
          break;
        default:
          day_set = 7;
      }
      params = {
        profile_id: id,
        days: day_set
      };
      return core.callApi('video', 'stats', params, null, function(err, data, status) {
        if (status === '200') {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    website = function(id, days, callback) {
      var day_set, params;
      switch (days) {
        case 1:
        case 7:
        case 30:
          day_set = days;
          break;
        default:
          day_set = 7;
      }
      params = {
        profile_id: id,
        days: day_set
      };
      return core.callApi('website', 'stats', params, null, function(err, data, status) {
        if (status === '200') {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    facebook = function(id, days, callback) {
      var day_set, params;
      switch (days) {
        case 1:
        case 7:
        case 30:
          day_set = days;
          break;
        default:
          day_set = 7;
      }
      params = {
        profile_id: id,
        days: day_set
      };
      return core.callApi('facebook', 'stats', params, null, function(err, data, status) {
        if (status === '200') {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    twitter = function(id, days, callback) {
      var day_set, params;
      switch (days) {
        case 1:
        case 7:
        case 30:
          day_set = days;
          break;
        default:
          day_set = 7;
      }
      params = {
        profile_id: id,
        days: day_set
      };
      return core.callApi('twitter', 'stats', params, null, function(err, data, status) {
        if (status === '200') {
          return callback(null, data, 200);
        } else {
          return callback({
            code: status,
            msg: err
          });
        }
      });
    };
    google_buzz = function(id, days, callback) {
      var day_set, params;
      switch (days) {
        case 1:
        case 7:
        case 30:
          day_set = days;
          break;
        default:
          day_set = 7;
      }
      params = {
        profile_id: id,
        days: day_set
      };
      return core.callApi('google_buzz', 'stats', params, null, function(err, data, status) {
        if (status === '200') {
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
