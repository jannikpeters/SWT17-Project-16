testing
testConnectionTrue
	| server|
	server := self newServerOnPort: 65004 
				   withProtocol: 'HTTP/1.1' 
				   code: 200 
				   response: 'HTTP/1.1 101 Switching Protocols'.
	self assert: (HTTP2TestingTool testConnection: 'localhost' port: 65004).
	server destroy.
	
	