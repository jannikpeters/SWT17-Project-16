as yet unclassified
receive
| length aFrame |
	[self stream atEnd] whileTrue: [
		self stream isDataAvailable ifTrue: [
			length := (self stream peek: 3) asInteger.
			aFrame := HTTP2Frame getFrameFrom: (self stream next: length + 9).
			Transcript show: aFrame.
			]]