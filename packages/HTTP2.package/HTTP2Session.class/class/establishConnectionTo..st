as yet unclassified
establishConnectionTo: server
|session|
	session := (HTTP2Session new)
		server: server;
		headerTableOut: (HTTP2HPACKIndexTable newWith: 4096);
		headerTableIn: (HTTP2HPACKIndexTable newWith: 4096);
		connect.
	session streamManager: (HTTP2StreamManager newOn: session stream).
	^session