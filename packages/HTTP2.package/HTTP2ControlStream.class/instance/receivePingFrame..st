as yet unclassified
receivePingFrame: aFrame
	aFrame flagAck: 1.
	self outQueue add: aFrame.