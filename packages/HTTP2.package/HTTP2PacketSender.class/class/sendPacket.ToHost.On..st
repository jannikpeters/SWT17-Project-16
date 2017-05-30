as yet unclassified
sendPacket: packet ToHost: hostName On: port
	|socket ip answer|
	answer := OrderedCollection new.
	socket := Socket new.
	ip := NetNameResolver addressForName: hostName timeout: 20.
	socket connectTo: ip port: port.
	socket sendData: packet.
	socket waitForData.
	socket receiveDataInto: answer.
	^ answer.
	 