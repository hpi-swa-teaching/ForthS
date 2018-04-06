initialization
loadDictionaryEntry: aFileStream

	self loadDictionaryEntryHeader: aFileStream.
	
	(self isPrimitiveWord: self dictionaryPointer)
		ifTrue: [self loadDictionaryEntrySTBody: aFileStream] 
		ifFalse: [self loadDictionaryEntryFORTHBody: aFileStream]