as yet unclassified
encode: anIndexTable
	| index byteArray |
	index := anIndexTable indexOf: self.
	index ~= 0 ifTrue: [^ self indexedRepresentation: index].
	byteArray := super encode: anIndexTable.
	anIndexTable add: self.
	^ byteArray