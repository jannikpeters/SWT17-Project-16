testing
testRST_STREAMFrame
	| frame | 
	frame := HTTP2RST_STREAMFrame new.
	frame streamIdentifier: 13.
	frame errorCode: 42.
	self assert: (frame encode) equals: #[16r0 16r0 16r04 16r03 16r00 16r0 16r0 16r0 16r0d 16r00 16r00 16r00 16r2a ].
	