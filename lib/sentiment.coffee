######
# Viralheat Sentiment module
######

exports = module.exports = (api_key) ->
	######
	# Module dependencies
	######
	core = require('./core')(api_key)
	
	get = (text, callback) ->
		core.callApi(
			'sentiment',
			'review',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	train = (text, mood, callback) ->
		core.callApi(
			'sentiment',
			'train',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	quota = (callback) ->
		core.callApi(
			'sentiment',
			'quota',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)

	return {
		train: train,
		get: get,
		quota: quota
	}