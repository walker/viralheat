######
# Viralheat Sentiment module
######

exports = module.exports = (api_key) ->
	######
	# Module dependencies
	######
	core = require('./core')(api_key)
	libxmljs = require('libxmljs')
	
	profiles = (page, callback) ->
		params =
			page_number: page
		
		core.callApi(
			'social_trends',
			'profiles',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	stats = (id, callback) ->
		params =
			profile_id: id
		
		core.callApi(
			'social_trends',
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