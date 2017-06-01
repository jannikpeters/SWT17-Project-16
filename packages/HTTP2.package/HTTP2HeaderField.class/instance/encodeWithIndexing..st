encoding
encodeWithIndexing: anIndexTable
	| index byteArray |
	index := anIndexTable indexOf: self.
	index ~= 0 ifTrue: [^ self indexedRepresentation: index].
	byteArray := self literalRepresentation: anIndexTable prefix: 64 length: 2.
	anIndexTable add: self key with: self value.
	^byteArray