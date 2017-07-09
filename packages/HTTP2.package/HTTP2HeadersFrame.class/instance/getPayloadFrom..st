as yet unclassified
getPayloadFrom: aByteArray
	| paddingLength |
	self flagPadded ifTrue: [paddingLength := super getPayloadFrom: aByteArray.
	
		self flagPriority ifTrue: [self getStreamDependencyFrom: aByteArray WithOffset:1. 
				self payload:  (aByteArray copyFrom:  16 to: (self length-paddingLength + 9)).]
		 ifFalse: [self payload:  (aByteArray copyFrom:  11 to: (self length-paddingLength + 9)).]
	] ifFalse: [self payload:  (aByteArray copyFrom:  10 to: (self length + 9)).]