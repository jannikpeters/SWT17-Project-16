as yet unclassified
newRequestFor: aPath
	| request |
	request := HTTP2Request new.
	request header: (HTTP2Header newInContext: self streamManager headerTableOut).
	request header
		add: ':method'-> 'GET';
		add: ':path' -> aPath;
		add: ':scheme' -> 'http';
		add: ':authority' -> self server.
	^ request.