as yet unclassified
connect
	self stream: (SocketStream openConnectionToHostNamed: self server port: 80).
	self stream nextPutAll: HTTP2Session connectionPreface, (HTTP2SettingsFrame fromParameters: #()) encode.
	[self receive] fork.
	self stream flush.