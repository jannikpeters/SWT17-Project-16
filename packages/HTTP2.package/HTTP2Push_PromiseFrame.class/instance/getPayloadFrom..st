accessing
getPayloadFrom: aByteArray
	| paddingLength |
	self flagPadded ifTrue: [paddingLength := super getPayloadFrom: aByteArray.
		 self promisedID: (self getIntegerFrom: aByteArray from: 11 to: 14 ).
		self payload:  (aByteArray copyFrom:  15 to: (self length-paddingLength + 9)).] 
	ifFalse: [
			self promisedID: (self getIntegerFrom: aByteArray from: 10 to: 13 ).
			self payload:  (aByteArray copyFrom:  14 to: (self length + 9)).]