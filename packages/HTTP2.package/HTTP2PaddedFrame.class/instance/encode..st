as yet unclassified
encode: aPayload
	| payload |
	payload := aPayload.
	self flagPadded ifTrue: [ payload := (self padding size asByteArrayOfSize: 1), payload, self padding].
	^ super encode: payload.