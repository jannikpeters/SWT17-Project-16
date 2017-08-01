as yet unclassified
satisfyHeaderLock
	| stream |
	stream := self activeStreams at: self headerLock.
	stream atEnd ifFalse:
		[self send: (stream nextFrame: self flowControlWindow)]