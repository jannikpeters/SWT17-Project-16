testing
testHeaderFrame
	| header frame array| 
	header := HTTP2Header new.
	header 
		add: ':method'->'GET';
		add: ':scheme'->'http';
		add: ':path' ->'/';
		add: ':authority'->'www.example.com'.
	frame := HTTP2HeadersFrame fromData: (header encode: (HTTP2HPACKIndexTable newWith: 1000)) andPaddingLength: 5.
	frame streamIdentifier: 13.
	frame flagPriority: 0.
	array := #[16r0 16r0 16r1a 16r01 16r08 16r0 16r0 16r0 16r0d 16r05 16r82 16r86 16r84 16r41 16r0f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d 16r0 16r0 16r0 16r0 16r0].
	self assert: (frame encode) equals: array.
	frame := HTTP2HeadersFrame getFrameFrom: array.
	self assert: (HTTP2Header newFrom: (frame payload) in: (HTTP2HPACKIndexTable newWith: 1000)) equals: header.
	
	