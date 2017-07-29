as yet unclassified
atEnd
	^ self headerStreamOut
		ifNil: [false]
		ifNotNil: [self headerStreamOut atEnd and: self dataStreamOut atEnd.]