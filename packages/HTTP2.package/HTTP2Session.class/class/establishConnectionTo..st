as yet unclassified
establishConnectionTo: server
	|session|
	session := (HTTP2Session new)
		server: server.
	session streamManager: (HTTP2StreamManager connectTo: server).
	^session