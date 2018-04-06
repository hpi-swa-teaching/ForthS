initialization
initializeReturnStack

	self return: (
		ForthSStack 
			newInMemory: self memory 
			withPointerAdress: self returnStackPointerAdress)