testing
testWindow_UpdateFrame 
	| frame |
	frame := HTTP2Window_UpdateFrame new.
	frame streamIdentifier: 13.
	frame increment: 42.
	self assert: (frame encode) equals: #[16r0 16r0 16r04 16r08 16r00 16r0 16r0 16r0 16r0d 16r0 16r0 16r0 16r2a].
	