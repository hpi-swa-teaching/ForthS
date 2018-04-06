initialization
loadDictionaryEntryHeader: aFileStream
	"Dictionary headers in a string are in the format:
	name of the word \n
	primitive boolean \n
	compile time boolean \n
	word body..."
	self 
		createWordHeader:  (self evaluateNext: aFileStream)
		isPrimitive: (self evaluateNext: aFileStream)
		isImmediate: (self evaluateNext: aFileStream)