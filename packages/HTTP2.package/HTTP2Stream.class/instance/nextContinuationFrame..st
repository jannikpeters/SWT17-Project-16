as yet unclassified
nextContinuationFrame: maxPayloadSize
	| frame |
	frame := (HTTP2ContinuationFrame new)
		streamIdentifier: self id;
		payload: (self headerStreamOut next: maxPayloadSize).
	self headerStreamOut atEnd ifTrue: [frame flagEndHeaders: 1].
	^ frame encode