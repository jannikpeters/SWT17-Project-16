as yet unclassified
sendFromControlStream
	self send: (self controlStream nextFrame: self flowControlWindow)