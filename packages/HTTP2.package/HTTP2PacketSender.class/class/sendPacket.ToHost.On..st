as yet unclassified
sendPacket: packet ToHost: hostName On: port
	|socket ip answer|
	answer := OrderedCollection new.
	socket := Socket new.
	ip := NetNameResolver addressForName: hostName timeout: 20.
	socket connectTo: ip port: port.
	[socket waitForConnectionFor: 10]
		on: ConnectionTimedOut
		do: [:ex |
			(self confirm: 'Continue to wait for connection to ', hostName, '?')
				ifTrue: [ex retry]
				ifFalse: [
					socket destroy.
					^ self]].
	socket sendData: packet.
	socket waitForData.
	socket receiveDataInto: answer.
	socket destroy.
	^ answer.
	 