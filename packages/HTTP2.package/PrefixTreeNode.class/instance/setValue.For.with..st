accessing
setValue: aValue For: searchPathInt with: ANDDecisionInt
	
	(((searchPathInt bitAnd: ANDDecisionInt) = 0) ifTrue: [
		zero ifNil: [ zero := (((ANDDecisionInt >> 1 = 0) ifTrue: [
				PrefixTreeLeaf 
				] 
			ifFalse: [
				PrefixTreeNode 
				]) new ).
		zero ]
	] ifFalse: [
		one ifNil: [ one := (((ANDDecisionInt >> 1) = 0) ifTrue: [
				PrefixTreeLeaf 
				] 
			ifFalse: [
				PrefixTreeNode 
				]) new .
		one ]
		] )  setValue: aValue For: searchPathInt with: (ANDDecisionInt >> 1).