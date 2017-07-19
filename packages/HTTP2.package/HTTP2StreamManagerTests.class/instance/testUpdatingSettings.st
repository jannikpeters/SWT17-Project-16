as yet unclassified
testUpdatingSettings
	| frame mockStream streamManager |
	mockStream := HTTP2MockSocketStream new.
	streamManager := HTTP2StreamManager new.
	streamManager socketStream: mockStream.
	streamManager initiateCommunication.
	mockStream reset.
	frame := HTTP2SettingsFrame new
			add: 'MaxConcurrentStreams'->110;
			add: 'HeaderTableSize'->2048;
			add: 'MaxFrameSize'->(2 raisedTo: 17);
			add: 'MaxHeaderListSize'->2000;
			yourself.
	mockStream inStream addAll: frame encode.
	
	(Delay forMilliseconds: 100) wait.
	frame := HTTP2SettingsFrame new
			flagAck: 1;
			yourself.
	self assert: mockStream outStream contents equals: frame encode.
	self assert: streamManager maxConcurrentStreams equals: 110.
	streamManager closeConnection.
	"Todo: test other settings"
	"initial window size will be tested in testFlowControlWindow"
	self assert: 0 equals: 1.