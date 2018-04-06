FORTH primitives
interpret: aString

	| wordPointer |
	wordPointer := self find: aString.
	(wordPointer ~= self null)
		ifTrue: [self execute: wordPointer]
		ifFalse: [self data push: (self number: aString)]