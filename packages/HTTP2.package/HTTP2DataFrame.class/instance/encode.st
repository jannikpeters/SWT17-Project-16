accessing
encode
	| payload |
	payload := self payload.
	self flagPadded ifTrue: [ payload := (self padding size asByteArrayOfSize: 1), payload, self padding].
	^ super encode: payload.