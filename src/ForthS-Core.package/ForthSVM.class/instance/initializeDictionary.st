initialization
initializeDictionary

	self dictionary: (
		ForthSStack 
			newInMemory: self memory
			withPointerAdress: self CPAdress)