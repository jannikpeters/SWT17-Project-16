as yet unclassified
evict: aSize
	| lastElement | 
	(self dynamicSize > aSize and: self dynamicTable size > 0)
		ifTrue: [ 
			lastElement := self dynamicTable last.
			self dynamicSize: self dynamicSize - (lastElement key byteSize + lastElement value byteSize +32). 
			dynamicTable removeLast.
			self evict: aSize]