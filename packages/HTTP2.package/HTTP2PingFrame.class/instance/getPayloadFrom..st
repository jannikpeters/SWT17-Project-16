as yet unclassified
getPayloadFrom: aByteArray
	self opaqueData: (self getIntegerFrom: aByteArray from: 10 to: 17).
	