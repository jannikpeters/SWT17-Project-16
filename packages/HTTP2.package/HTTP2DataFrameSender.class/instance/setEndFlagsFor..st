as yet unclassified
setEndFlagsFor: aFrame
	self stream byteStreamOut atEnd ifTrue: [aFrame flagEndStream: 1]