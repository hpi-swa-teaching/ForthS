FORTH execution
executeSmalltalk: aPointer

	| string | 
	string := self memory at: aPointer + self codeOffset.
	Compiler evaluate: string for: self