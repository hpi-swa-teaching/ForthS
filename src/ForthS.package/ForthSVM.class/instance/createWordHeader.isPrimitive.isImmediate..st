FORTH compilation
createWordHeader: wordName isPrimitive: isPrimitive isImmediate: isImmediate
	"CP is a FORTH specific abbreviation, meaning: Compilation Pointer (where to compile new content in the dictionary to.)"
	| currentCP |
	currentCP := self dictionary pointer.
	self dictionary push: wordName.
	self dictionary push: self dictionaryPointer.
	self dictionaryPointer: currentCP.
	self dictionary push: isPrimitive.
	self dictionary push: isImmediate