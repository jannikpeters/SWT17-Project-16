as yet unclassified
encode 
" alters state of whole connection"
	| payload |
	payload := #[].
	self parameterList do: [:association | payload := payload, 
		((association key) asByteArrayOfSize: 2),
		((association value) asByteArrayOfSize: 4)].
	^ super encode: payload.