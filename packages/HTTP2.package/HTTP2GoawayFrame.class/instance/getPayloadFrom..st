as yet unclassified
getPayloadFrom: aByteArray
	| length |
	length := self getIntegerFrom: aByteArray from: 1 to: 3.
	self lastID: (self getIntegerFrom: aByteArray from: 10 to: 13).
	self errorCode: (self getIntegerFrom: aByteArray from: 14 to: 17).
	self debugData: ((aByteArray copyFrom: 18 to: length+9) asArray).
