as yet unclassified
nextDataFrame: maxPayloadSize
	| frame byteArray |
	frame := (HTTP2DataFrame new)
		payload: (self dataStreamOut next: maxPayloadSize - 9);
		streamIdentifier: self id.
	self dataStreamOut atEnd ifTrue: [frame flagEndStream: 1. self state allDataSent].
	byteArray := frame encode.
	self updateWindowSize: (byteArray size - 9) negated.
	^ byteArray