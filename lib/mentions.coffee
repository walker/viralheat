######
# Viralheat Sentiment module
######

exports = module.exports = (api_key) ->
	######
	# Module dependencies
	######
	core = require('./core')(api_key)
	libxmljs = require('libxmljs')
	
	website = (id, page, callback) ->
		page_number = page ? page : 0;
		
		params =
			profile_id: id
			page_number: page_number
		
		core.callApi(
			'website',
			'mentions',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	video = (id, page, callback) ->
		page_number = page ? page : 0;
		
		params =
			profile_id: id
			page_number: page_number
		
		core.callApi(
			'video',
			'mentions',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	facebook = (id, page, callback) ->
		page_number = page ? page : 0;
		
		params =
			profile_id: id
			page_number: page_number
		
		core.callApi(
			'facebook',
			'mentions',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)

	google_buzz = (id, page, callback) ->
		page_number = page ? page : 0;
		
		params =
			profile_id: id
			page_number: page_number
		
		core.callApi(
			'google_buzz',
			'mentions',
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
		website: website
		video: video
		facebook: facebook
		twitter: twitter
		google_buzz: google_buzz
	}