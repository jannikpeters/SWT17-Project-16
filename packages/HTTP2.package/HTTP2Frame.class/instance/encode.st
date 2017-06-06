encode
encode
	^ (self payloadLength asByteArrayOfSize: 3),
	(self type asByteArrayOfSize: 1),
	(self flags asByteArrayOfSize: 1),
	(self streamIdentifier asByteArrayOfSize: 4),
	(self payload)