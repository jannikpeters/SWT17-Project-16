as yet unclassified
indexOf: anAssociation
	| index |
	index := self staticTable indexOf: anAssociation.
	index ~= 0 ifTrue: [^ index].
	index := self dynamicTable indexOf: anAssociation.
	index = 0 ifTrue: [^ 0]  ifFalse: [ ^ index + 61] 