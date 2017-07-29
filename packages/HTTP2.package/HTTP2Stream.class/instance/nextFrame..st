accessing
nextFrame: maxPayloadSize
	| maxSize frame |
	maxSize := maxPayloadSize min: self flowControlWindow.
	frame := self sender nextFrame: maxSize.
	self updateWindowSize: (frame size - 9) negated.
	^ frame
	"self headerStreamOut ifNil: [
		^ self firstHeaderFrame: maxSize].
	self headerStreamOut atEnd ifFalse: [
		^ self nextContinuationFrame: maxSize].
	self dataStreamOut atEnd ifFalse: [
		^ self nextDataFrame: maxSize]."