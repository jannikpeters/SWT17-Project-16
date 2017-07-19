accessing
updateMaxFrameSize: anInteger
	"ignore that setting as we only send frames with min size"
	(anInteger >= (2 raisedTo: 14) and: anInteger < (2 raisedTo: 24))
		ifTrue: [self maxFrameSize: anInteger]
		ifFalse: ["this seriously must not happen"].