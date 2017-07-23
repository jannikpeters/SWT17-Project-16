instance creation
decodeHuffman: encodedBlock
| root result resultIndex node  bytePosition bitPosition andComparator |

root := self getHuffmanTree.

result := Dictionary  new.
resultIndex := 1.

bytePosition := 1.
bitPosition := 7.

[true] whileTrue: [
	node := root.
	[node isNode and: bytePosition <= encodedBlock size] whileTrue: [
		andComparator := 1 << bitPosition.
		node := node getNodeFor: (encodedBlock at: bytePosition) with: andComparator.
		bitPosition := bitPosition - 1.
		(bitPosition = -1) ifTrue: [
			bitPosition := 7.
			bytePosition := bytePosition + 1.
		] 
	].
	node isNil ifTrue: [
		self halt.
		^ ByteArray withAll: result
	].

	[ node isNode ] whileTrue: [
		node := node one.
	].
	
	node ifNil: [
		^ ByteArray withAll: result
	].

	result at: resultIndex put: node value  - 1.
		(bytePosition > encodedBlock size) ifTrue: [ 
			^ ByteArray withAll: result
	].

	resultIndex := resultIndex + 1.
	]