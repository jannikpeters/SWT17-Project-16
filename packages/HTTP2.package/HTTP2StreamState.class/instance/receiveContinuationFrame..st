as yet unclassified
receiveContinuationFrame: aFrame
	self http2stream isWaitingForContinuationFrames ifTrue: [
		self http2stream headerStreamIn nextPutAll: aFrame payload.
		aFrame flagEndHeaders = 1 ifTrue:
			[self http2stream isWaitingForContinuationFrames: false.
			self http2stream headerCompleted]]
	ifFalse: [
		Error signal: 'No Continuation Frames were expected!']