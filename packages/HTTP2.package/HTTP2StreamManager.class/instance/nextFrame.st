as yet unclassified
nextFrame
	self controlStream hasFrames
		ifTrue: [^ self controlStream nextFrame: self flowControlWindow]
		ifFalse: [
			self activeStreams do: [:http2stream |
				http2stream atEnd ifFalse:
					[^ http2stream nextFrame: self flowControlWindow]]]