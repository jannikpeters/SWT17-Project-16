instance creation
newFrom: aHeaderBlock in: aContext
	| stream header |
	stream := ReadStream on: aHeaderBlock.
	header := self newInContext: HTTP2HPACKIndexTable new.
	[stream atEnd] whileFalse: [
		header add: (HTTP2HeaderField newFrom: stream in: aContext).].
	^ header.