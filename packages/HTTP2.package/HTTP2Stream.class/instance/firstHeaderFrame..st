as yet unclassified
firstHeaderFrame: maxPayloadSize
	| frame byteArray |
	self headerStreamOut: (ReadStream on: (self request header encode: self streamManager headerTableOut)).
	frame := (HTTP2HeadersFrame new)
		streamIdentifier: self id;
		payload: (self headerStreamOut next: maxPayloadSize).
	self setEndFlagsFor: frame.
	byteArray := frame encode.
	self updateWindowSize: (byteArray size - 9) negated.
	^ byteArray