as yet unclassified
sendConnectionPreface
	| frame |
	self socketStream nextPutAll: HTTP2StreamManager connectionPreface.
	"disable server push"
	frame := (HTTP2SettingsFrame new)
			add: 'EnablePush'->0;
			add: 'InitialWindowSize'->((2 raisedTo: 31) - 1);
			yourself.
	self socketStream nextPutAll: frame encode; flush.