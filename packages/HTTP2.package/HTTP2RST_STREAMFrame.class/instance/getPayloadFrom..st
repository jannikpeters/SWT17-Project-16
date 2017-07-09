as yet unclassified
getPayloadFrom: aByteArray
	self errorCode: (self getIntegerFrom: aByteArray from: 10 to: 13).