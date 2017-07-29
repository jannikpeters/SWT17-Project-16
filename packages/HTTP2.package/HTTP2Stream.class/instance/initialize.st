as yet unclassified
initialize
	self headerStreamIn: (WriteStream on: ByteArray new).
	self dataStreamIn: (WriteStream on: ByteArray new).
	self state: (HTTP2OpenState newFor: self).
	self isWaitingForContinuationFrames: false.
	self flowControlWindow: (2 raisedTo: 16) - 1.
	self sender: (HTTP2HeaderFrameSender newFor: self).