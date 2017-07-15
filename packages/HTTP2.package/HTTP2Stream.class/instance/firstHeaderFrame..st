as yet unclassified
firstHeaderFrame: maxPayloadSize
	| frame |
	self headerStreamOut: (ReadStream on: (self request header encode)).
	frame := (HTTP2HeadersFrame new)
		streamIdentifier: self id;
		payload: (self headerStreamOut next: maxPayloadSize).
	self setEndFlagsFor: frame.
	^ frame encode.