encoding
encodeWithoutIndexing: anIndexTable
	^ self literalRepresentation: anIndexTable prefix: 0 length: 4. 
	