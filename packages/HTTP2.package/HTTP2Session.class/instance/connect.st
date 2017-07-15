as yet unclassified
connect
	self stream: (SocketStream openConnectionToHostNamed: self server port: 80).
	self stream nextPutAll: HTTP2Session connectionPreface, (HTTP2SettingsFrame fromParameters: #()) encode.
	self stream flush.
	(Delay forMilliseconds: 200) wait.
	self stream nextPutAll: #[16r00 16r00 16r00 16r04 16r01 16r00 16r00 16r00 16r00].
	self stream flush.