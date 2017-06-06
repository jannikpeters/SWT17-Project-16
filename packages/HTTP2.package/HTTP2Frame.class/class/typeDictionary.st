as yet unclassified
typeDictionary 
	typeDictionary
		ifNil: [
			typeDictionary := Dictionary new
				at: #DATA put: 0;
				at: #HEADERS put: 1;
				at: #PRIORITY put: 2;
				at: #RST_STREAM put: 3;
				at: #SETTINGS put: 4;
				at: #PUSH_PROMISE put: 5;
				at: #PING put: 6;
				at: #GOAWAY put: 7;
				at: #WINDOW_UPDATE put: 8;
				at: #CONTINUATION put: 9;
				yourself].
	^ typeDictionary.