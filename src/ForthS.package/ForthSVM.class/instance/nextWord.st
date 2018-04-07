FORTH primitives
nextWord

	| substrings result |
	substrings := self inputBuffer subStrings: self wordDelimiters.
	substrings ifEmpty: [ ^ self error: 'Input Buffer empty!' ].
	
	"Convert from Array to OrderedCollection for ease of use"
	substrings := substrings asOrderedCollection.
	result := substrings removeFirst.
	self inputBuffer: (substrings joinSeparatedBy: Character space).
	^ result