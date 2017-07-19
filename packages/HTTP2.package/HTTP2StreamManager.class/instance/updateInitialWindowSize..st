accessing
updateInitialWindowSize: anInteger
	(anInteger >= (2 raisedTo: 14) and: anInteger < (2 raisedTo: 24))
		ifTrue: [self initialWindowSize: anInteger]
		ifFalse:["we should throw an Error here"]