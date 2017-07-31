as yet unclassified
sendFromStreams
	self activeStreams do: [:http2stream |
		http2stream atEnd ifFalse:
			[^ self send: (http2stream nextFrame: self flowControlWindow)]]