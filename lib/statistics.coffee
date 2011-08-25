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
		switch days
			when 1, 7, 30
				day_set = days
			else
				day_set = 7
		
		params =
			profile_id: id
			days: day_set
		
		core.callApi(
			'video',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status==200)
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	website = (id, days, callback) ->
		switch days
			when 1, 7, 30
				day_set = days
			else
				day_set = 7
		
		params =
			profile_id: id
			days: day_set
		
		core.callApi(
			'website',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status==200)
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	facebook = (id, days, callback) ->
		switch days
			when 1, 7, 30
				day_set = days
			else
				day_set = 7
		
		params =
			profile_id: id
			days: day_set
		
		core.callApi(
			'facebook',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status==200)
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	twitter = (id, days, callback) ->
		switch days
			when 1, 7, 30
				day_set = days
			else
				day_set = 7
		
		params =
			profile_id: id,
			days: day_set
		
		core.callApi(
			'twitter',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status==200)
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	google_buzz = (id, days, callback) ->
		switch days
			when 1, 7, 30
				day_set = days
			else
				day_set = 7
		
		params =
			profile_id: id
			days: day_set
		
		core.callApi(
			'google_buzz',
			'stats',
			params,
			null,
			(err, data, status) ->
				if(status==200)
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	return {
		website: website
		video: video
		facebook: facebook
		twitter: twitter
		google_buzz: google_buzz
	}