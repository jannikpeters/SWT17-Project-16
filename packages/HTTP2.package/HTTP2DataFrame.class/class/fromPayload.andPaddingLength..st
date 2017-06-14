class initialization
fromPayload: aPayload andPaddingLength: aPaddingLength
	| frame |
	frame := super fromPayload: 
		(aPaddingLength asByteArrayOfSize: 1), 
		aPayload, 
		(ByteArray new: aPaddingLength).
	frame flagPadded: 1.
	^ frame