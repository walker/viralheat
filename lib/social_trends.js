(function() {
  var exports;
  exports = module.exports = function(api_key) {
    var core, libxmljs, profiles, stats;
    core = require('./core')(api_key);
    libxmljs = require('libxmljs');
    profiles = function(page, callback) {
      var page_number, params;
      if (page) {
        page_number = page != null ? page : {
          page: 1
        };
      } else {
        page_number = 1;
      }
      params = {
        page_number: page_number
      };
      return core.callApi('social_trends', 'profiles', params, null, function(err, data, status) {
        var i, profiles_list, returned, xmlDoc;
        if (status === 200) {
          returned = [];
          xmlDoc = libxmljs.parseXmlString(data);
          profiles_list = xmlDoc.find('//profile');
          if (typeof profiles_list === 'object') {
            i = 0;
            profiles_list.forEach(function(profile) {
              returned[i] = {
                'id': profile.get('id').text(),
                'name': profile.get('name').text(),
                'expression': profile.get('expression').text(),
                'created_at': profile.get('created_at').text(),
                'category': profile.get('category').text()
              };
              return i++;
            });
          }
          return callback(null, returned, 200);
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
        var returned, xmlDoc;
        if (status === 200) {
          returned = {
            id: null,
            name: null,
            expression: null,
            twitter: {},
            facebook: {},
            website: {},
            video: {}
          };
          xmlDoc = libxmljs.parseXmlString(data);
          returned.id = xmlDoc.get('//id').text();
          returned.name = xmlDoc.get('//name').text();
          returned.expression = xmlDoc.get('//expression').text();
          returned.twitter.total_tweets_seven_days = xmlDoc.get('//total_tweets_seven_days').text();
          returned.twitter.average_tweets = xmlDoc.get('//average_tweets').text();
          returned.twitter.total_tweets_today = xmlDoc.get('//total_tweets_today').text();
          returned.twitter.latest_tweet = xmlDoc.get('//latest_tweet').text();
          returned.twitter.latest_tweet_url = xmlDoc.get('//latest_tweet_url').text();
          returned.twitter.popular_author = xmlDoc.get('//popular_author').text();
          returned.facebook.total_posts_seven_days = xmlDoc.get('//total_posts_seven_days').text();
          returned.facebook.average_posts = xmlDoc.get('//average_posts').text();
          returned.facebook.total_posts_today = xmlDoc.get('//total_posts_today').text();
          returned.facebook.popular_page = xmlDoc.get('//popular_page').text();
          returned.facebook.popular_page_url = xmlDoc.get('//popular_page_url').text();
          returned.website.total_sites_seven_days = xmlDoc.get('//total_sites_seven_days').text();
          returned.website.average_sites = xmlDoc.get('//average_sites').text();
          returned.website.total_sites_today = xmlDoc.get('//total_sites_today').text();
          returned.website.top_domain = xmlDoc.get('//top_domain').text();
          returned.website.top_domain_shares = xmlDoc.get('//top_domain_shares').text();
          returned.website.top_link = xmlDoc.get('//top_link').text();
          returned.website.top_link_url = xmlDoc.get('//top_link_url').text();
          returned.website.top_link_shares = xmlDoc.get('//top_link_shares').text();
          returned.video.total_videos_seven_days = xmlDoc.get('//total_videos_seven_days').text();
          returned.video.total_video_views = xmlDoc.get('//total_video_views').text();
          returned.video.hottest_video = xmlDoc.get('//hottest_video').text();
          returned.video.hottest_video_url = xmlDoc.get('//hottest_video_url').text();
          returned.video.hottest_video_platform = xmlDoc.get('//hottest_video_platform').text();
          returned.video.latest_video = xmlDoc.get('//latest_video').text();
          returned.video.latest_video_url = xmlDoc.get('//latest_video_url').text();
          return callback(null, returned, 200);
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
