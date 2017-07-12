as yet unclassified
receive: aFrame
	aFrame class = HTTP2HeadersFrame ifTrue:[
		self headerBlockIn: self headerBlockIn, aFrame payload.
		aFrame flagEndHeaders ifTrue: [
			self response header: (HTTP2Header newFrom: self headerBlockIn in: self session headerTableIn).
		].
		aFrame flagEndStream ifTrue: [
			self responseBlock value: self response.
		]
	].
	aFrame class = HTTP2HeadersFrame ifTrue:[
		self response data: self response data, aFrame payload.
	]