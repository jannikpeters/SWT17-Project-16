as yet unclassified
newRequest
	| request |
	request := HTTP2Request new.
	request header: (HTTP2Header newInContext: self headerTableOut).
	request header
		add: ':method'-> 'GET';
		add: ':path' -> '/dashboard/';
		add: ':scheme' -> 'http';
		add: ':authority' -> 'localhost'.
	^ request.