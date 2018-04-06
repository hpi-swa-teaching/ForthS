FORTH execution
execute: aPointer

	| primitive |
	aPointer = self null
		ifTrue: [self errorNullPointer].
	
	primitive := self isPrimitiveWord: aPointer.
	primitive 
		ifTrue: [self executeSmalltalk: aPointer]
		ifFalse: [self executeFORTH: aPointer]