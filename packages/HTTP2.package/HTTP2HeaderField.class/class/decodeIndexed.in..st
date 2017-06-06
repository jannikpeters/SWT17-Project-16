as yet unclassified
decodeIndexed: aStream in: aContext
	| index |
	index := self decodeInteger: aStream prefix: 7.