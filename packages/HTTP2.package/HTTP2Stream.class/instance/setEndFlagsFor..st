as yet unclassified
setEndFlagsFor: aHeaderFrame
	self headerStreamOut atEnd ifTrue: [
		aHeaderFrame flagEndHeaders: 1].
	self dataStreamOut atEnd ifTrue: [
		aHeaderFrame flagEndStream: 1].