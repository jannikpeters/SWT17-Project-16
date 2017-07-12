as yet unclassified
establishConnectionTo: server
	^ (HTTP2Session new)
		server: server;
		headerTableOut: (HTTP2HPACKIndexTable newWith: 4096);
		headerTableIn: (HTTP2HPACKIndexTable newWith: 4096);
		connect.