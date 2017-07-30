as yet unclassified
deliverResponse
	| response |
	response := (HTTP2Response new)
		header: self responseHeader;
		data: self byteStreamIn contents.
	[self responseBlock value: response] fork