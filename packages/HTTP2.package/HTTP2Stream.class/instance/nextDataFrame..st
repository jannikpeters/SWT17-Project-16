as yet unclassified
nextDataFrame: maxPayloadSize
	| frame |
	frame := (HTTP2DataFrame new)
		payload: (self dataStreamOut next: maxPayloadSize);
		streamIdentifier: self id.
	self dataStreamOut atEnd ifTrue: [frame flagEndStream: 1].
	^ frame encode