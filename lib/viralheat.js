(function() {
  var exports;
  exports = module.exports = function(api_key) {
    return {
      api_key: api_key,
      sentiment: require('./sentiment')(api_key),
      social_trends: require('./social_trends')(api_key),
      profiles: require('./profiles')(api_key),
      statistics: require('./statistics')(api_key),
      trends: require('./trends')(api_key),
      mentions: require('./mentions')(api_key)
    };
  };
}).call(this);
