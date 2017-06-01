as yet unclassified
addConcat: anAssociation
	| newValue |
	newValue := (self at: anAssociation key ifAbsent:  [ ^ '' ]), ', ', anAssociation value.
	self at: anAssociation key put: newValue.