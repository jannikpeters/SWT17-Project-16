accessing
connectTo: aServer
	self establishTransportLayerConnectionTo: aServer.
	self initiateCommunication.