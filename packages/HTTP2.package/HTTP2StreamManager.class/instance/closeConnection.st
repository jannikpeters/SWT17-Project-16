as yet unclassified
closeConnection
	self connectionActive: false.
	self socketStream nextPutAll: (HTTP2GoawayFrame new streamIdentifier: 0; lastID: 2; errorCode: 0; debugData: ''; yourself) encode.
	self socketStream flush.
	(Delay forMilliseconds: 20) wait.
	self socketStream close.