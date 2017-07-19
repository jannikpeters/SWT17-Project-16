instance creation
encodeHuffman: decodedBlock
| code length minLength maxLength result resultIndex filledBits actualLength actualPlain shiftCount byteCount byteAnd newValue |

code := self getHuffmanRFCValueCollection.
length := self getHuffmanRFCLengthCollection.

minLength := 3.
maxLength := 30.

result := Dictionary new.
resultIndex := 1.
filledBits := 0.

decodedBlock do: [:byte|
	actualLength := length at: (byte + 1).
	actualPlain := code at: (byte + 1).
	
	shiftCount := ((40 - actualLength - filledBits) \\ 8).
	actualPlain := actualPlain << shiftCount.
	byteCount := actualLength // 8 + 1.
	(actualLength \\ 8 + shiftCount) > 8 ifTrue: [
		byteCount := byteCount + 1.
	].
	byteAnd := 255 << (8 * (byteCount - 1)) .
	
	1 to: byteCount do: [ :n|
		newValue := (actualPlain bitAnd: byteAnd) >> (byteCount - n * 8).
		resultIndex > result size ifTrue:  [
			result at: resultIndex put: newValue.
		]  ifFalse: [
			result at: resultIndex put: (newValue + result at: resultIndex).
		].
		resultIndex := resultIndex + 1.
		byteAnd := byteAnd >> 8.
	].
	filledBits := filledBits + actualLength \\ 8.
	filledBits = 0 ifFalse: [
		resultIndex := resultIndex -1]
	].
^ ByteArray withAll: result
