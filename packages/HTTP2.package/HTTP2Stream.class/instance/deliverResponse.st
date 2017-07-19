as yet unclassified
deliverResponse
	| response |
	response := (HTTP2Response new)
		header: self responseHeader;
		data: self dataStreamIn contents.
	[self responseBlock value: response] fork