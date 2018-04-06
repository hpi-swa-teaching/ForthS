instance creation
newInMemory: aDynamicArray withPointerAdress: aNumber

	^ self basicNew
		memory: aDynamicArray;
		pointerAdress: aNumber;
		initialize;
		yourself