initialization
loadDictionaryEntryFORTHBody: aFileStream

	| value |
	[value := self evaluateNext: aFileStream]
		whileNotNil: [self dictionary push: value].
	"Always push exit to make sure every word returns"
	self dictionary push: (self tick: 'exit').
	
	"nil indicates the end of a word body"
	self dictionary push: nil