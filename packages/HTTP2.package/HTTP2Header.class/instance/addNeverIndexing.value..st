adding
addNeverIndexing: aKey value: aValue
	super add: (HTTP2HeaderField key: aKey value: aValue indexingAction: #encodeNeverIndexing:)