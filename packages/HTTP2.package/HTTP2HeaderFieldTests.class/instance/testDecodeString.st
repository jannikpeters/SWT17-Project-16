testDecode
testDecodeString
	self assert:(HTTP2HeaderField decodeString: (ReadStream on:self class customKeyinByte)) equals:  'custom-key'.
	self assert:(HTTP2HeaderField decodeString: (ReadStream on:self class customValueInByte)) equals:  'custom-value'
