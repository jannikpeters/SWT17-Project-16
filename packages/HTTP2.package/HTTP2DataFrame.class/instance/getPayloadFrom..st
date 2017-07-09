accessing
getPayloadFrom: aByteArray
	| paddingLength |
	self flagPadded ifTrue: [paddingLength := super getPayloadFrom: aByteArray.
	self payload:  (aByteArray copyFrom:  11 to: (self length-paddingLength + 9)).] ifFalse: [self payload:  (aByteArray copyFrom:  10 to: (self length + 9)).]
	
	