as yet unclassified
constructPayload 
	| payload |
	payload := #[].
	self parameterList do: [:association | payload := payload, 
		((association key) asByteArrayOfSize: 2),
		((association value) asByteArrayOfSize: 4)].
	^ payload 