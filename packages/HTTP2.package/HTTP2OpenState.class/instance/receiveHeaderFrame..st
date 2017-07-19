as yet unclassified
receiveHeaderFrame: aFrame
	self http2stream headerStreamIn nextPutAll: aFrame payload.
	aFrame flagEndStream = 1 ifTrue: [
		self http2stream state: (HTTP2HalfClosedRemoteState newFor: self http2stream)].
	aFrame flagEndHeaders = 0
		ifTrue: [self http2stream isWaitingForContinuationFrames: true]
		ifFalse: [self http2stream headerCompleted].