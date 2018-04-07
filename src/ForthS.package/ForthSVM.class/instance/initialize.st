initialization
initialize

	self
		running: false; 
		initializeMemory;
		initializeDataStack;
		initializeReturnStack;
		initializeDictionary;
		loadDefaultDictionary