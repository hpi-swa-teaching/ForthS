FORTH compilation
isImmediateWord: aWordPointer

	^ self memory at: aWordPointer + self immediateOffset