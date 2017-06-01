encoding
literalRepresentation: anIndexTable prefix: aPrefix length: aLength
	| index |
	index := anIndexTable indexOfKey: self key.
	index ~= 0 ifTrue: [^ self literalRepresentationIndexedKey: index prefix: aPrefix length: aLength].
	^ self literalRepresentationNewKey: aPrefix.  