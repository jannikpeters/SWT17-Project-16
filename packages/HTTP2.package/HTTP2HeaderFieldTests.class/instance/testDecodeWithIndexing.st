tests
testDecodeWithIndexing
	|headerF|
	headerF:= HTTP2HeaderField decodeLiteralWithIndexing: (ReadStream on: #[82]) in: (HTTP2HPACKIndexTable staticTable).
	self assert: headerF equals: (HTTP2HeaderField key: ':method' value: 'GET').   