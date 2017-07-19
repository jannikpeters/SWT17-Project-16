as yet unclassified
receiveDataFrame: aFrame
	self http2stream dataStreamIn nextPutAll: aFrame payload.
	aFrame flagEndStream = 1 ifTrue: [self http2stream state: (HTTP2HalfClosedRemoteState newFor: self http2stream). self http2stream deliverResponse]