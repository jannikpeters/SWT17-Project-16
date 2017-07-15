accessing
nextFrame: maxPayloadSize
	self headerStreamOut ifNil: [
		^ self firstHeaderFrame: maxPayloadSize].
	self headerStreamOut atEnd ifFalse: [
		^ self nextContinuationFrame: maxPayloadSize].
	self dataStreamOut atEnd ifFalse: [
		^ self nextDataFrame: maxPayloadSize].