testing
testConnectionFalse
	|server|
	server := WebServer newForUrl: 'localhost'.
	server listenOn: 65005.
	server addService: '/' action: [:req | 
		|resp| 
		resp := req newResponse protocol: 'HTTP/1.1' code: 302.  
		^req sendResponse: resp content: 'Moved Permanently to https://localhost'.].
	self assert: (HTTP2TestingTool testConnection: 'localhost' port: 65005) equals: false.
	server destroy.