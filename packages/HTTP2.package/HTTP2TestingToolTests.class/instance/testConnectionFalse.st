testing
testConnectionFalse
	|server|
	server := self newServerOnPort: 65005 withProtocol: 'HTTP/1.1' code: 302 response: 'Moved Permanently to https://localhost'.
	self assert: (HTTP2TestingTool testConnection: 'localhost' port: 65005) equals: false.
	server destroy.