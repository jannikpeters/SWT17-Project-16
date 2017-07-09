accessing
getPayloadFrom: aByteArray
	self streamDependency: (self getIntegerFrom: aByteArray from: 10 to: 13).
	self E: (streamDependency bitAt: 32).
	self streamDependency: (self streamDependency bitAt: 32 put: 0).
	self weight: (self getIntegerFrom: aByteArray from: 14 to: 14).
	