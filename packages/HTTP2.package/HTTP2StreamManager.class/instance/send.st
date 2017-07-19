as yet unclassified
send
	self controlStream hasFrames ifTrue: [
			self socketStream nextPutAll: (self controlStream nextFrame: 10000); flush.
		]
		ifFalse: [
			self activeStreams do: [:http2stream |
				http2stream atEnd ifFalse:
					[self socketStream nextPutAll: (http2stream nextFrame: 16000); flush.]]]