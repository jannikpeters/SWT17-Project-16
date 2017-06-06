as yet unclassified
newFrom: aHeaderBlock in: aContext
	| stream |
	stream := ReadStream on: aHeaderBlock.
	self add: (HTTP2HeaderField newFrom: stream in: aContext).