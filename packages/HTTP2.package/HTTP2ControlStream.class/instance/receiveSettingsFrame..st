as yet unclassified
receiveSettingsFrame: aFrame
	| parameterList |
	aFrame flagAck = 0 ifTrue: [
	parameterList := aFrame parameterList.
	parameterList do: [:parameter | 
		self streamManager perform: ('update', parameter key,':') asSymbol withArguments: (Array with: parameter value)].
	self outQueue add: (HTTP2SettingsFrame new
		flagAck: 1;
		yourself).]