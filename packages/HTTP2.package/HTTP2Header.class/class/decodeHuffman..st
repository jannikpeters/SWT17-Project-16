instance creation
decodeHuffman: encodedBlock
| root result resultIndex node  bytePosition bitPosition andComparator |

root := self getHuffmanTree.

result := Dictionary new.
resultIndex := 1.

bytePosition := 1.
bitPosition := 7.

[True initializedInstance] whileTrue: [
	
	node := root.
	[node isNode] whileTrue: [
		andComparator := 1 << bitPosition.
		node := node getNodeFor: (encodedBlock at: bytePosition) with: andComparator.
		bitPosition := bitPosition - 1.
		(bitPosition = -1) ifTrue: [
			bitPosition := 7.
			bytePosition := bytePosition + 1.
			(bytePosition > encodedBlock size) ifTrue: [ 
				^ result
				]
			]
		] .
	result at: resultIndex put: node value  - 1.
	resultIndex := resultIndex + 1.
	]


