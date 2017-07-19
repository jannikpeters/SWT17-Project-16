as yet unclassified
connectTo: aServer
	^ (HTTP2StreamManager new)
		connectTo: aServer;
		yourself.