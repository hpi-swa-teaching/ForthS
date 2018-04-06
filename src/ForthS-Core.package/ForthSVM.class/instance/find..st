FORTH primitives
find: aString
	"The FORTH dictionary builds up a linked list, to find a word, iterate the linked list."
	| wordPointer |
	wordPointer := self dictionaryPointer.
	[wordPointer ~= self null]
		whileTrue: [
			((self wordName: wordPointer) asLowercase) = aString asLowercase
				ifTrue: [^ wordPointer]
				ifFalse: [wordPointer := self previousWord: wordPointer]].
	
	"Returning self null on a find signals the word was not found.
	If you want to get an error, when the word is not found, use 'tick'."
	^ self null