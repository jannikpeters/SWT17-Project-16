testing
testSETTINGSFrame
	| frame parameterList |
	parameterList := OrderedCollection new.
	parameterList 
		add: (7->42);
		add: (3->4). 
	frame := HTTP2SettingsFrame fromParameters: parameterList.
	frame streamIdentifier: 13.
	self assert: (frame encode) equals: #[16r0 16r0 16r0c 16r04 16r00 16r00 16r00 16r00 16r00 16r00 16r07 16r0 16r0 16r0 16r2a 16r0 16r3 16r0 16r0 16r0 16r4 ].
	frame flagAck: 1.
	frame add: (6->7).
	self assert: (frame encode) equals: #[16r0 16r0 16r12 16r04 16r01 16r00 16r00 16r00 16r00 16r00 16r07 16r0 16r0 16r0 16r2a 16r0 16r3 16r0 16r0 16r0 16r4 16r0 16r06 16r0 16r0 16r0 16r07].
	