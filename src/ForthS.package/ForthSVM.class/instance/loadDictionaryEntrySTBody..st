initialization
loadDictionaryEntrySTBody: aFileStream

	| value |
	[value := self evaluateNext: aFileStream.
	self dictionary push: value]
		doWhileFalse: [value isNil]