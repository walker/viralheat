######
# Viralheat Sentiment module
######

exports = module.exports = (api_key) ->
	######
	# Module dependencies
	######
	core = require('./core')(api_key)
	libxmljs = require('libxmljs')
	
	video = (id, days, callback) ->
		params =
			profile_id: id
			days: days
		
		core.callApi(
			'video',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	website = (id, days, callback) ->
		params =
			profile_id: id
			days: days
		
		core.callApi(
			'website',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	facebook = (id, days, callback) ->
		params =
			profile_id: id
			days: days
		
		core.callApi(
			'facebook',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	twitter = (id, days, callback) ->
		params =
			profile_id: id,
			days: days
		
		core.callApi(
			'twitter',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	google_buzz = (id, days, callback) ->
		params =
			profile_id: id
			days: days
		
		core.callApi(
			'google_buzz',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	return {
		profiles: train,
		stats: get,
	}