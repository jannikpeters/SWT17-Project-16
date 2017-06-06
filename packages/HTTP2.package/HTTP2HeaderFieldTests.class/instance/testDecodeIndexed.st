tests
testDecodeIndexed
	|headerF|
	headerF:= HTTP2HeaderField decodeIndexed: (ReadStream on: #[82]) in: (HTTP2HPACKIndexTable staticTable).
	self assert: headerF equals: (HTTP2HeaderField key: ':method' value: 'GET').   