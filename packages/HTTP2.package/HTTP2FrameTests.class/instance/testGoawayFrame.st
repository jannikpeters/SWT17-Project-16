testing
testGoawayFrame 
	| frame |
	frame := HTTP2GoawayFrame new.
	frame streamIdentifier: 13.
	frame lastID: 13.
	frame errorCode: 42.
	frame debugData: #(42 0 13). 
	self assert: (frame encode) equals: #[16r0 16r0 16r0b 16r07 16r00 16r0 16r0 16r0 16r00 16r0 16r0 16r0 16r0d 16r0 16r0 16r0 16r2a 16r2a 16r0 16r0d].
	