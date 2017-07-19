as yet unclassified
encode 
" alters state of whole connection"
	| payload |
	payload := #[].
	self parameterList do: [:association | payload := payload, 
		((HTTP2SettingsFrame settingsToIntDictionary at: association key) asByteArrayOfSize: 2),
		((association value) asByteArrayOfSize: 4)].
	^ super encode: payload.