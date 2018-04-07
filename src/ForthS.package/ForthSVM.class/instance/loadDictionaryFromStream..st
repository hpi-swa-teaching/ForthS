initialization
loadDictionaryFromStream: aStream

	[aStream atEnd] 
		whileFalse: [self loadDictionaryEntry: aStream]