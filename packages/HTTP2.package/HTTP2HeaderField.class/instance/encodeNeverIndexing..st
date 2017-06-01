encoding
encodeNeverIndexing: anIndexTable
	^ self literalRepresentation: anIndexTable prefix: 16 length: 4.