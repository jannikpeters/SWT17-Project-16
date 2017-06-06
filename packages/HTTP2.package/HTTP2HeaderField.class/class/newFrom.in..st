as yet unclassified
newFrom: aStream in: aContext
	| firstByte |
	firstByte := aStream peek.
	(firstByte bitAt: 0) = 1
		ifTrue: [^ self decodeIndexed: aStream in: aContext]
		ifFalse: [(firstByte bitAt: 3) = 1
			ifTrue: [^ self decodeLiteralWithIndexing: aStream in: aContext]
			ifFalse: [^ self decodeLiteralWithoutIndexing: aStream in: aContext]]