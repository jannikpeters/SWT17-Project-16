indexing
indexOfKey: aKey
	| index |
	index := 1.
	self staticTable do: [:association | 
		association key ~= aKey 
			ifTrue: [index := index + 1] 
			ifFalse: [^ index]]. 
	self dynamicTable do: [:association | 
		association key ~= aKey 
			ifTrue: [index := index + 1] 
			ifFalse: [^ index]]. 
	^ 0.