initialization
loadMemoryFromString: aString

	| stringStream |
	stringStream := aString readStream.
	[stringStream atEnd]
		whileFalse: [self memory addLast: (self evaluateNext: stringStream)]