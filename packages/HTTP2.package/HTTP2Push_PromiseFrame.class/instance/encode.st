as yet unclassified
encode
	^ super encode: 
		((self promisedID) asByteArrayOfSize: 4), 
		self payload