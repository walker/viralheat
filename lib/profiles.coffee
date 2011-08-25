######
# Viralheat Profiles module
######

exports = module.exports = (api_key) ->
	######
	# Module dependencies
	######
	core = require('./core')(api_key)
	libxmljs = require('libxmljs')
	
	create = (expression, options, callback) ->
		params =
			expression: expression
				
		core.callApi(
			'profile',
			'create',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	edit = (id, expression, options, callback) ->
		params =
			profile_id: id
			expression: expression
		
		# Deal with Options.
		
		core.callApi(
			'profile',
			'edit',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	delete = (id, callback) ->
		params =
			profile_id: id
		
		core.callApi(
			'profile',
			'delete',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	list_all = (callback) ->
		core.callApi(
			'profile',
			'list_all',
			null,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	
	details = (id, callback) ->
		params =
			profile_id: id
		
		core.callApi(
			'profile',
			'details',
			params,
			null,
			(err, data, status) ->
				if(status=='200')
					# do XML munging here
					callback(null, data, 200)
				else
					callback({code:status, msg: err})
		)
	