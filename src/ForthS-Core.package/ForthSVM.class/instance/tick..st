FORTH primitives
tick: aString
	"Tick is a FORTH specific term. The equivalent FORTH word is  '  (pronounced as 'tick')"
	| wordPointer |
	wordPointer := self find: aString.
	^ wordPointer = self null
		ifTrue: [self error: 'Word: ', aString, ' could not be found!']
		ifFalse: [wordPointer]