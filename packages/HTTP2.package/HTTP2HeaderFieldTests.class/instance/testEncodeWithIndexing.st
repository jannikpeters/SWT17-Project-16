testEncode
testEncodeWithIndexing
	| headerField indexTable |
	headerField := HTTP2HeaderFieldWithIndexing key: 'custom-key' value: 'custom-header'.
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	self assert: (headerField encode: indexTable) equals: #[16r40 16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79 16r0d 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r68 16r65 16r61 16r64 16r65 16r72].
	self assert: indexTable dynamicTable size equals: 1.
	self assert: (headerField encode: indexTable) equals: #[190].
	indexTable add: 'custom' with: 'notValue'. 
	headerField := HTTP2HeaderFieldWithIndexing key: 'custom' value: 'custom-header'.
	self assert: (headerField encode: indexTable) equals: #[16r7e 16r0d 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r68 16r65 16r61 16r64 16r65 16r72].
	self assert: indexTable dynamicTable size equals: 2.
	 