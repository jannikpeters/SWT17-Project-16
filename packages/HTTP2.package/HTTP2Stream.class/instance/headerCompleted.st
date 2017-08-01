as yet unclassified
headerCompleted
	self responseHeader:" self headerStreamIn contents" (HTTP2Header newFrom: self byteStreamIn contents in: self streamManager headerTableIn)"<- doesnt work so far".
	self byteStreamIn resetContents