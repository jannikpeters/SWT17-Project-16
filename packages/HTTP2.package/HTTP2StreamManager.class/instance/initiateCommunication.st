accessing
initiateCommunication
	self controlStream: HTTP2ControlStream new.
	[self sendLoop] fork.
	[self receiveLoop] fork.