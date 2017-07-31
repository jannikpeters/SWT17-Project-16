as yet unclassified
send
	self headerLock = 0
	ifTrue: [self controlStream hasFrames
		ifTrue: [self sendFromControlStream]
		ifFalse: [self sendFromStreams]]
	ifFalse: [self satisfyHeaderLock]