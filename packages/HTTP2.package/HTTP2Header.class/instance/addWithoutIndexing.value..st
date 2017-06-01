as yet unclassified
addWithoutIndexing: aKey value: aValue
	super add: (HTTP2HeaderField key: aKey value: aValue indexingAction: #encodeWithoutIndexing:)