as yet unclassified
nextContinuationFrame: maxPayloadSize
	| frame byteArray |
	frame := (HTTP2ContinuationFrame new)
		streamIdentifier: self id;
		payload: (self headerStreamOut next: maxPayloadSize - 9).
	self headerStreamOut atEnd ifTrue: [frame flagEndHeaders: 1].
	byteArray := frame encode.
	self updateWindowSize: (byteArray size - 9) negated.
	^ byteArray