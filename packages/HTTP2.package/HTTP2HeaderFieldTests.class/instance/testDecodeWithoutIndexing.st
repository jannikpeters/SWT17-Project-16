testDecode
testDecodeWithoutIndexing
	| headerF indexTable |
	indexTable := HTTP2HPACKIndexTable newWith: 100.
	headerF := HTTP2HeaderField decodeLiteralWithoutIndexing: (ReadStream on: #[16r01 16r0f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d]) in: indexTable.
	self assert: headerF equals: (HTTP2HeaderField key: ':authority' value: 'www.example.com').
	self assert: indexTable dynamicTable size equals: 0.
	headerF := HTTP2HeaderField decodeLiteralWithoutIndexing: (ReadStream on: #[ 16r10 16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79  16r0c 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r76 16r61 16r6c 16r75 16r65]) in: indexTable.
	self assert: headerF equals: (HTTP2HeaderField key: 'custom-key' value: 'custom-value').
	self assert: indexTable dynamicTable size equals: 0.