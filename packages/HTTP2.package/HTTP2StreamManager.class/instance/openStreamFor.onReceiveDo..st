as yet unclassified
openStreamFor: aRequest onReceiveDo: responseBlock
	|id http2stream |
	id := self nextFreeStreamIdPostIncrement.
	http2stream := HTTP2Stream new: id for: aRequest onReceiveDo: responseBlock.
	self activeStreams at: id put: http2stream.