testEncode
testEncodeWithoutIndexing
	| headerField indexTable |
	headerField := HTTP2HeaderField key: ':path' value: '/sample/path'.
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	headerField indexingAction: #encodeWithoutIndexing:.
	self assert: (headerField encode: indexTable) equals: #[16r04 16r0c 16r2f 16r73 16r61 16r6d 16r70 16r6c 16r65 16r2f 16r70 16r61 16r74 16r68].
	self assert: indexTable dynamicTable size equals: 0.
	headerField := HTTP2HeaderField key: 'custom-key' value: 'custom-header'.
	headerField indexingAction: #encodeWithoutIndexing:.
	self assert: (headerField encode: indexTable) equals: #[16r00 16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79 16r0d 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r68 16r65 16r61 16r64 16r65 16r72].
	self assert: indexTable dynamicTable size equals: 0.
