testing
testPriorityFrame
	| frame | 
	frame := HTTP2PriorityFrame new.
	frame streamIdentifier: 13.
	frame E: 1.
	frame streamDependency: 7.
	frame weight: 8.
	self assert: (frame encode) equals: #[16r0 16r0 16r05 16r02 16r00 16r0 16r0 16r0 16r0d 16r80 16r00 16r00 16r07 16r08 ].
	