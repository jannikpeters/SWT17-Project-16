encoding
encode
	^ ByteArray streamContents: [:stream |
		self associationsDo: [:association |
			stream nextPutAll: (association encodeWithPayload: self indexTable)]]