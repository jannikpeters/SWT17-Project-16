as yet unclassified
send: aRequest
	| headerFrame |
	headerFrame := (HTTP2HeadersFrame new) payload: aRequest header encode.
	headerFrame flagEndHeaders: 1.
	headerFrame flagEndStream: 1.
	headerFrame streamIdentifier: 1.
	self stream nextPutAll: headerFrame encode;
		flush.
	self halt.
	self stream nextPutAll: #[16r00 16r00   16r00 16r00 16r06 16r04 16r01 16r00 16r00 16r00 16r00 16r00 16r03 16r00 16r00 16r00 16r64].