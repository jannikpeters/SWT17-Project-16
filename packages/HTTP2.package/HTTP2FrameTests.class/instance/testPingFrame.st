testing
testPingFrame 
	| frame |
	frame := HTTP2PingFrame fromOpaqueData: 42.
	frame streamIdentifier: 13.
	self assert: (frame encode) equals: #[16r0 16r0 16r08 16r06 16r00 16r0 16r0 16r0 16r00 16r0 16r0 16r0 16r0 16r0 16r0 16r0 16r2a].
	