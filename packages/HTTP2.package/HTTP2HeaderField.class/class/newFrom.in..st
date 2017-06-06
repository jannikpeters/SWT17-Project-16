as yet unclassified
newFrom: aStream in: aContext
	| firstByte |
	firstByte := aStream peek.
	firstByte >= 128
		ifTrue: [^ self decodeIndexed: aStream in: aContext]
		ifFalse: [firstByte >= 64
			ifTrue: [^ self decodeLiteralWithIndexing: aStream in: aContext]
			ifFalse: [^ self decodeLiteralWithoutIndexing: aStream in: aContext]]