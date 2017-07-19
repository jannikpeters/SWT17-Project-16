as yet unclassified
headerCompleted
	self responseHeader:" self headerStreamIn contents" (HTTP2Header newFrom: self headerStreamIn contents asByteArray in: self streamManager headerTableIn)"<- doesnt work so far".
	self state headerCompleted