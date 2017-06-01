as yet unclassified
testConnectionTrue
	| server|
	server := WebServer newForUrl: 'localhost'.
	server listenOn: 65004.
	server addService: '/' action: [:req | 
		|resp| 
		resp := req newResponse protocol: 'HTTP/1.1' code: 200.  
		^req sendResponse: resp content: 'HTTP/1.1 101 Switching Protocols'.].
	self assert: (HTTP2TestingTool testConnection: 'localhost' port: 65004) equals: true.
	server destroy.
	
	