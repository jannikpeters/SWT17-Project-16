as yet unclassified
encode
	| headerBlock |
	headerBlock := ByteArray new.
	self associationsDo: [:association| headerBlock := headerBlock, (association encode: self indexTable)].  
	^ headerBlock