testDecode
testDecodeString
	self assert:(HTTP2HeaderField decodeString: (ReadStream on:#[16r0a 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r6b 16r65 16r79])) equals:  'custom-key'.
	self assert:(HTTP2HeaderField decodeString: (ReadStream on:#[16r0c 16r63 16r75 16r73 16r74 16r6f 16r6d 16r2d 16r76 16r61 16r6c 16r75 16r65])) equals:  'custom-value'
