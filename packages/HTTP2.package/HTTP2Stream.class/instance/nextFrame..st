accessing
nextFrame: maxPayloadSize
	| maxSize |
	maxSize := maxPayloadSize min: self flowControlWindow.
	self headerStreamOut ifNil: [
		^ self firstHeaderFrame: maxSize].
	self headerStreamOut atEnd ifFalse: [
		^ self nextContinuationFrame: maxSize].
	self dataStreamOut atEnd ifFalse: [
		^ self nextDataFrame: maxSize].