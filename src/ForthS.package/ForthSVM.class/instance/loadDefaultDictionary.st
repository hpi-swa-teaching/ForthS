initialization
loadDefaultDictionary

	self loadDictionaryFromStream: self bootstrapDict readStream.
	self evaluate: self initializeFORTH