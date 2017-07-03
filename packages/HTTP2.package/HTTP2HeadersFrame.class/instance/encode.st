as yet unclassified
encode
"maybe the part with padding in padded frame"
	| payload |
	payload := self payload.
	self flagPriority ifTrue: [ payload := 
		((self streamDependency bitAt: 32 put: (self E)) asByteArrayOfSize: 4), 
		((self weight) asByteArrayOfSize: 1), 
		payload].
	^ super encode: payload.