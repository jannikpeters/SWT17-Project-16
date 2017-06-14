decode
decodeString: aStream
	| length |
	length := self decodeInteger: aStream prefix: 7.
	^ (aStream next: length) asString