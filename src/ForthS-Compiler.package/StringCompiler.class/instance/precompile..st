compilation
precompile: textOrStream

	| stringStream text ranges line beforeKey |
	text := textOrStream.
	stringStream := textOrStream asString readStream. "Make sure it is a string stream"
	beforeKey := String new.
	[stringStream atEnd]
		whileFalse: [
			line := stringStream nextLine.
			ranges := line allRangesOfRegexMatches: '<', self keyword, '>'.
			ranges 
				ifEmpty: [beforeKey := beforeKey, line, Character cr]
				ifNotEmpty: [text := beforeKey, (self createMethodBody: stringStream)]].
	
	^ text readStream