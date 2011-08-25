Support for the [Viralheat](http://www.viralheat.com/) API.

See [viralheat-sentiment](https://github.com/walker/viralheat-sentiment) for a lighter-weight module that provides only sentiment analysis.


Support for the [Viralheat](http://www.viralheat.com/) API.

Sentiment analysis only (look for viralheat module for support for entire module & method set).

Reuire the module:

```
var viralheat = require('viralheat-sentiment')('[API Key Here]');
```

Make a sentiment request:

```
viralheat.sentiment.get('[text you would like analyzed]', function(err, data, status) {
	if(err) {
		// Error
	} else {
		res.send(data);
	}
});
```

Data will look something like this:

```
{"prob":0.838018305485215,"mood":"positive","text":"[The text you had analyzed]"}
```

Train the sentiment analyzer:

```
viralheat.sentiment.train('[text you would like analyzed]', [sentiment value like 0.43565432], function(err, data, status) {
	if(err) {
		// Error
	} else {
		res.send(data);
	}
});
```

Standard response from a train request:

```
{"status":"ok"}
```

Also, check your quota:

```
viralheat.sentiment.quota(function(err, data, status) {
	if(err) {
		// Error
	} else {
		res.send(data.quota_remaining);
	}
});
```


Get the list of social trend searches available:

```
viralheat.social_trends.profiles(200, function(err, data, status) {
	if err
		res.send(err)
	else
		res.send(data)
});
```

Get the statistics for a particular search, in this case: Organic Recipes

```
viralheat.social_trends.stats(18882, function(err, data, status) {
	if err
		res.send(err)
	else
		res.send(data)
});
```