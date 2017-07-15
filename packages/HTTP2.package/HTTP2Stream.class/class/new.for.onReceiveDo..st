as yet unclassified
new: id for: aRequest onReceiveDo: responseBlock
	^ (HTTP2Stream new)
		id: id;
		request: aRequest;
		responseBlock: responseBlock;
		buildDataStream.