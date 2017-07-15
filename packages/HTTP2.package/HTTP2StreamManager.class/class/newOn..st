as yet unclassified
newOn: aSocketStream
	^ (HTTP2StreamManager new)
		socketStream: aSocketStream;
		initiateCommunication;
		connectionActive: true;
		yourself