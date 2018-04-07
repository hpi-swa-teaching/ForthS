FORTH execution
isPrimitiveWord: aPointer

	^ self memory at: aPointer + self primitiveOffset