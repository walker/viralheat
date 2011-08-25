(function() {
  var exports;
  exports = module.exports = function(api_key) {
    return {
      api_key: api_key,
      sentiment: require('./sentiment')(api_key),
      social_trends: require('./social_trends')(api_key)
    };
  };
}).call(this);
