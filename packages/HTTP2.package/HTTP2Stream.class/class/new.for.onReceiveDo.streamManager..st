as yet unclassified
new: id for: aRequest onReceiveDo: responseBlock streamManager: aStreamManager
	^ (HTTP2Stream new)
		id: id;
		request: aRequest;
		responseBlock: responseBlock;
		streamManager: aStreamManager;
		flowControlWindow: aStreamManager initialWindowSize;
		yourself.