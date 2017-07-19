accessing
socketClosed
	self connectionActive ifTrue: [
		self responseToUnfinishedRequests.
		self connectionActive: false.
	]
	"if the connection isn't active, the client already closed the connection"