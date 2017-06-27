as yet unclassified
E: aBit
	self flagPriority ifTrue: [
	self streamDependency: (self streamDependency bitAt: 32 put: aBit).] 
