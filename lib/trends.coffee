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
			'trend',
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
			'trend',
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
			'trend',
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
			profile_id: id
			days: days
		
		core.callApi(
			'twitter',
			'trend',
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
			'trend',
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