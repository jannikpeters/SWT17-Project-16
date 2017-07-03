accessing
encode
	| payload |
	payload:=
		(self lastID asByteArrayOfSize: 4), 
		(self errorCode asByteArrayOfSize: 4),
		self debugData asByteArray.
	^ super encode: payload