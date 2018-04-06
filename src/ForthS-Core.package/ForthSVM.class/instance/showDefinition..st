debugging
showDefinition: aWordName
	"Written to get quick access to a words definition.
	Returns an OrderedCollection containing the contents of the words body and the the contents of the adress each body entrance points to."
	"This method is still Work in progress and has a lot of unwanted effects (it for example only shows the word body up to the first nil)"
	| wordPointer result definitionEntry |
	wordPointer := self tick: aWordName.
	result := OrderedCollection new.
	result addLast: aWordName.
	wordPointer := wordPointer + 1.
	definitionEntry := self memory at: wordPointer.
	[definitionEntry]
		whileNotNil: [
			result addLast:
				(definitionEntry isInteger
					ifTrue: [
						definitionEntry asString , ' -> ' , 
							(self memory 
								at: (definitionEntry) 
								ifAbsent: [''])]
					ifFalse: [ definitionEntry ]).
			wordPointer := wordPointer + 1.
			definitionEntry := self memory at: wordPointer].
	
	^ result