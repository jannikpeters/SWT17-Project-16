as yet unclassified
getPayloadFrom: aByteArray
	| paddingLength  |
	
	paddingLength := self getIntegerFrom: aByteArray from: 10 to: 10. 
	self padding: (self getIntegerFrom: aByteArray from: (self length-paddingLength + 9) to: self length + 9).
	^ paddingLength