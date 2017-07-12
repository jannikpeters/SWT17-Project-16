as yet unclassified
receive
| length aFrame |
	[self stream atEnd not] whileTrue: [
		self stream isEmpty not ifTrue: [
			length := (self stream peek: 3) asByteArray asInteger.
			aFrame := HTTP2Frame getFrameFrom: (self stream next: length + 9) asByteArray.
			Transcript show: aFrame; show: '', Character cr, Character lf.
			aFrame class = HTTP2DataFrame ifTrue: [
				Transcript show: aFrame payload; show: '',Character cr, Character lf.
				].
			].
		(Delay forMilliseconds:  20) wait.].
	Transcript show: 'I ended'; show:'', Character cr, Character lf.