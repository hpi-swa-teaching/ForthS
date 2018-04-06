FORTH primitives
previousWord: aWordPointer

	^ self memory at: aWordPointer + self previousWordOffset