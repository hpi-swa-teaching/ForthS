initialization
initializeDataStack

	self data: (
		ForthSStack 
			newInMemory: self memory 
			withPointerAdress: self stackPointerAdress)