as yet unclassified
receiveWindowUpdateFrame: aFrame
	self http2stream increaseFlowControlWindow: aFrame increment