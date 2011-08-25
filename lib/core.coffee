######
# Core API functionality for all modules
######

######
# Module dependencies
######
http = require('http')
urlParser = require('url')
path = require('path')
qs = require('querystring')
i = require('util').inspect

module.exports = (api_key) ->
	api_url = 'http://www.viralheat.com/api/'
	
	######
	# Standard post
	#
	# @param {String} url API URL for the endpoint you are calling + params
	######
	# post = (url, data, callback) ->
	# 	parsedUrl = urlParser.parse(url, true)
	# 	result = ''
	# 	
	# 	if (parsedUrl.query == undefined)
	# 		parsedUrl.query = {}
	# 	
	# 	pathstr = parsedUrl.pathname
	# 	
	# 	if(parsedUrl.query != undefined)
	# 		pathstr = pathstr + "?" + qs.stringify(parsedUrl.query)
	# 	
	# 	request = http.request(
	# 		{
	# 			"host" : parsedUrl.hostname,
	# 			"port" : parsedUrl.port,
	# 			"path" : pathstr,
	# 			"method" : "POST",
	# 			"headers" :
	# 				"Content-Length": data.length
	# 		},
	# 		(res) ->
	# 			res.setEncoding('utf8')
	# 			res.on("data",
	# 				(chunk) ->
	# 					result += chunk
	# 			)
	# 			res.on("end",
	# 				() ->
	# 					result = result
	# 					# console.log(result)
	# 					callback(null, result, res.statusCode)
	# 			)
	# 	)
	# 	
	# 	request.on("error", (err) ->
	# 		callback(err)
	# 	)
	# 	request.write(data)
	# 	request.end()
		
	######
	# Standard get
	#
	# @param {String} url API URL for the endpoint you are calling + params
	######
	get = (url, callback) ->
		parsedUrl = urlParser.parse(url, true)
		result = ""
		
		if (parsedUrl.query == undefined)
			parsedUrl.query = {}
		
		pathstr = parsedUrl.pathname + "?" + qs.stringify(parsedUrl.query)
		
		request = http.request({
				"host" : parsedUrl.hostname,
				"port" : parsedUrl.port,
				"path" : pathstr,
				"method" : "GET",
				"headers" : {
					"Content-Length": 0
				}
			},
			(res) ->
				res.on("data", (chunk) ->
					result += chunk
				)
				res.on("end", () ->
					result = result
					# console.log(result)
					callback(null, result, res.statusCode)
				)
		)
		
		request.on("error", (err) ->
			callback(err)
		)
		
		request.end()
	
	######
	# Process Array Utility 
	######
	process_array = (items, process) ->
		todo = items.concat()
		
		setTimeout(() ->
			process(todo.shift)
			if(todo.length > 0)
				setTimeout(arguments.callee, 25)
		, 25)
	
	######
	# Expose public
	######
	return {
		# post: post,
		process_array: process_array,
		get: get,
		######
		# Call API
		#
		# @param {String} module The Viralheat API module
		# @param {String} method Module method
		# @param {Object} parameters Parameters to pass to the method
		# @param {Function} callback Callback to handle Viralheat response
		# @return {Object} Viralheat response
		######
		callApi: (module, method, params, payload, callback) ->
			if(typeof callback isnt 'function')
				callback = (err, data, status) ->
					console.log('No callback was set for '+module+'.'+'method')
			if (!module || !method)
				new Error('viralheat.callAPI: Module and Method are required.')
				return
				
			if(_is('get', module, method))
				if !params
					params =  {}
				params.api_key = api_key
			else
				params = null
			
			baseUrl = api_url
			parsedParams = qs.stringify(params).replace(/\%2c/ig, ',')
			switch module
				when 'profiles', 'statistics', 'data'
					fullUrl = baseUrl + path.join(module, method)
				else
					fullUrl = baseUrl + path.join(module, method) + '.json'
			
			if(_is('get', module, method) && typeof token == 'string')
				console.log('GET: ' + fullUrl + '?' + parsedParams)
				get(fullUrl + '?' + parsedParams + '&api_key=' + api_key, callback)
			else
				console.log('POST: ' + fullUrl + '?api_key=' + api_key, callback)
				# we don't have any post methods yet.
				# console.log(payload)
				# post(fullUrl + '?api_key=' + api_key, payload, callback)
	}

_is = (type, module, method) ->
	if(type=='get')
		switch module
			when 'profiles'
				switch method
					when 'list_all', 'details', 'alerts'
						return true
					else
						return false
			when 'statistics', 'data', 'social_trends', 'sentiment', 'messaging'
				return true
			else
				return false
	else if(type=='post')
		switch module
			when 'profiles'
				switch method
					when 'list_all', 'details', 'alerts'
						return false
					else
						return true
			else
				return false
