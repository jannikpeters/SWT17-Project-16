accessing
getNodeFor: searchString with: ANDDecisionString
	^ (((searchString bitAnd: ANDDecisionString) = 0) ifTrue: [
		zero 
		] ifFalse: [
		one
		] ) .