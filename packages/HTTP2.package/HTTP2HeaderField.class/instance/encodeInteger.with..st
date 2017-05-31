encoding
encodeInteger: anInteger with: prefix
	| solution remainder index cachedPrefix |
	cachedPrefix:= (2 raisedToInteger: prefix) - 1.
	anInteger < cachedPrefix
		ifTrue: [^ anInteger asByteArrayOfSize: 1] 
		ifFalse: [ remainder := anInteger - cachedPrefix.
			solution := ByteArray new: (anInteger log: 128) ceiling + 1.
			index := 2.
			[remainder >= 128] whileTrue: [
				solution at: index put: remainder \\ 128 + 128.
				index := index + 1.
				remainder := remainder >> 7. ].
			solution at: index put: remainder.
			solution at: 1 put: cachedPrefix.
			^solution
			]