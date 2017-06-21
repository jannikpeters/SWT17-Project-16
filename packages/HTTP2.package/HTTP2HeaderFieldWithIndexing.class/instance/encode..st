as yet unclassified
encode: anIndexTable
	| byteArray |
	^ anIndexTable indexOf: self
		ifPresent:  [:index | self indexedRepresentation: index] 
		ifAbsent: [byteArray := super encode: anIndexTable.
			anIndexTable add: self.
			byteArray]
	
	