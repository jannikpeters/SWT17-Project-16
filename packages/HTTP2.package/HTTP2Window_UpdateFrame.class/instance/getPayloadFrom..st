as yet unclassified
getPayloadFrom: aByteArray
	self increment: (self getIntegerFrom: aByteArray from: 10 to: 13).