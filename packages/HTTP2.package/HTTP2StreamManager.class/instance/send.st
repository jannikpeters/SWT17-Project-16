as yet unclassified
send
	self activeStreams do: [:http2stream |
		http2stream atEnd ifFalse:
			[self socketStream nextPutAll: (http2stream nextFrame: 16000); flush.
			^ self]]