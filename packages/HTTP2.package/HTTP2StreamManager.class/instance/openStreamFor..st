as yet unclassified
openStreamFor: aRequest
	| id http2stream |
	id := self nextFreeStreamIdPostIncrement.
	http2stream := HTTP2Stream new: id for: aRequest streamManager: self.
	self activeStreams at: id put: http2stream.
	^ http2stream promise