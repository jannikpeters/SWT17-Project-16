as yet unclassified
receiveRSTStreamFrame: aFrame
	self http2stream state: (HTTP2ClosedState newFor: self http2stream)
	"Todo: do some stuff to really close the stream here!!!"