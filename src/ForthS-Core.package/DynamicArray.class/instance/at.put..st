accessing
at: anInteger put: anObject

	^ anInteger <= self size
		ifTrue: [super at: anInteger put: anObject]
		ifFalse: [self at: anInteger ifAbsentPut: anObject]