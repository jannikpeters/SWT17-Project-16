accessing
getValueFor: searchString with: ANDDecisionString
	^ ((searchString bitAnd: ANDDecisionString = 0) ifTrue: [
		zero 
		] ifFalse: [
		one
		] ) getValueFor: searchString with: (ANDDecisionString >> 1).