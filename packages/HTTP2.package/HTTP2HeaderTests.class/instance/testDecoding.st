as yet unclassified
testDecoding
	| header indexTable |
	indexTable := HTTP2HPACKIndexTable newWith: 200.
	header := HTTP2Header newFrom: #[16r82 16r86 16r84 16r41 16r0f 16r77 16r77 16r77 16r2e 16r65 16r78 16r61 16r6d 16r70 16r6c 16r65 16r2e 16r63 16r6f 16r6d] in: indexTable.
	self assert: (header at: ':method') equals: 'GET'.
	self assert: (header at: ':scheme') equals: 'http'.
	self assert: (header at: ':path') equals: '/'.
	self assert: (header at: ':authority') equals: 'www.example.com'.
	self assert: (indexTable at: 62) equals:(HTTP2HeaderField key: ':authority' value: 'www.example.com').