accessing
globalInstance
	
	GlobalInstance
		ifNil: [self reset].
	^ GlobalInstance