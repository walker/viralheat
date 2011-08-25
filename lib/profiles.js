(function() {
  var exports;
  exports = module.exports = function(api_key) {
    var core, create, details, edit, libxmljs, list_all, remove;
    core = require('./core')(api_key);
    libxmljs = require('libxmljs');
    create = function(expression, options, callback) {
      var params;
      params = {
        expression: expression
      };
      return core.callApi('profile', 'create', params, null, function(err, data, status) {
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
    edit = function(id, expression, options, callback) {
      var params;
      params = {
        profile_id: id,
        expression: expression
      };
      return core.callApi('profile', 'edit', params, null, function(err, data, status) {
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
    remove = function(id, callback) {
      var params;
      params = {
        profile_id: id
      };
      return core.callApi('profile', 'delete', params, null, function(err, data, status) {
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
    list_all = function(callback) {
      return core.callApi('profile', 'list_all', null, null, function(err, data, status) {
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
    details = function(id, callback) {
      var params;
      params = {
        profile_id: id
      };
      return core.callApi('profile', 'details', params, null, function(err, data, status) {
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
      create: create,
      edit: edit,
      remove: remove,
      list_all: list_all,
      details: details
    };
  };
}).call(this);
