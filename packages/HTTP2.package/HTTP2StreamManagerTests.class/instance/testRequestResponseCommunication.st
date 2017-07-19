as yet unclassified
testRequestResponseCommunication
	| streamManager mockStream outframe inframe request response sem inHeader |
	mockStream := HTTP2MockSocketStream new.
	streamManager := HTTP2StreamManager new.
	"dont't use connectTo: method because we need to apply MockSocketStream instead of establishing real Connection"
	streamManager socketStream: mockStream.
	streamManager initiateCommunication.
	(Delay forMilliseconds: 10) wait.
	mockStream reset.
	request := HTTP2Request new.
	request header: (HTTP2Header newInContext: streamManager headerTableOut).
	request header
		add: ':method'-> 'GET';
		add: ':path' -> '/aPath/example/';
		add: ':scheme' -> 'http';
		add: ':authority' -> 'www.example.com'.
	sem := Semaphore new.
	streamManager openStreamFor: request onReceiveDo: [:resp|response := resp. sem signal.].
	(Delay forMilliseconds: 10) wait.
	outframe := HTTP2HeadersFrame new
		payload: ((HTTP2Header newInContext: (HTTP2HPACKIndexTable newWith: 4096))
				add: ':method'-> 'GET';
				add: ':path' -> '/aPath/example/';
				add: ':scheme' -> 'http';
				add: ':authority' -> 'www.example.com';
				yourself) encode;
		streamIdentifier: 3;
		flagEndStream: 1;
		flagEndHeaders: 1;
		yourself.
	self assert: mockStream outStream contents equals: outframe encode.
	inHeader := (HTTP2Header newInContext: (HTTP2HPACKIndexTable newWith: 4096))
				add: ':status'-> '200';
				add: 'content-length' -> '9';
				add: 'content-type' -> 'text/html';
				add: 'accept-ranges' -> 'bytes';
				yourself.
	inframe := HTTP2HeadersFrame new
		payload: inHeader encode;
		streamIdentifier: 3;
		flagEndHeaders: 1;
		yourself.
	mockStream inStream addAll: inframe encode.
	inframe := HTTP2DataFrame new
		payload: 'some data';
		streamIdentifier: 3;
		flagEndStream: 1;
		yourself.
	mockStream inStream addAll: inframe encode.
	sem wait.
	self assert: response header equals: inHeader.
	self assert: response data equals: 'some data' asByteArray