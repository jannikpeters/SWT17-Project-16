tests
testEncodeNeverIndexing
	| headerField indexTable |
	headerField := HTTP2HeaderField key: 'password' value: 'secret'.
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	headerField indexingAction: #encodeNeverIndexing:.
	self assert: (headerField encode: indexTable) equals: #[16r10 16r08 16r70 16r61 16r73 16r73 16r77 16r6f 16r72 16r64 16r06 16r73 16r65 16r63 16r72 16r65 16r74].
	self assert: indexTable dynamicTable size equals: 0.
	headerField := HTTP2HeaderField key: 'custom-key' value: 'custom-header'.
	headerField indexingAction: #encodeNeverIndexing:.
	self assert: (headerField encode: indexTable) equals: #[16r10 16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79 16r0d 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r68 16r65 16r61 16r64 16r65 16r72].
	self assert: indexTable dynamicTable size equals: 0.
