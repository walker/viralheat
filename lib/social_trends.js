(function() {
  var exports;
  exports = module.exports = function(api_key) {
    var core, libxmljs, profiles, stats;
    core = require('./core')(api_key);
    libxmljs = require('libxmljs');
    profiles = function(page, callback) {
      var page_number, params;
      page_number = page != null ? page : {
        page: 0
      };
      params = {
        page_number: page_number
      };
      return core.callApi('social_trends', 'profiles', params, null, function(err, data, status) {
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
    stats = function(id, callback) {
      var params;
      params = {
        profile_id: id
      };
      return core.callApi('social_trends', 'stats', params, null, function(err, data, status) {
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
      profiles: profiles,
      stats: stats
    };
  };
}).call(this);
