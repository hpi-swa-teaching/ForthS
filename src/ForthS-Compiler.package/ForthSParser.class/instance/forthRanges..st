parse
forthRanges: aString
	"Ranges must be returned sorted for the result to be computed correctly"
	| sortedRanges escapedString |
	sortedRanges := SortedCollection sortBlock: [:a :b | a start <= b start].
	escapedString := aString asUppercase copyWithRegex: ' |\t|\n|\r' matchesReplacedWith: ' '.
	self keywordStyles do:[:assoc | | keywordRanges |
		keywordRanges := escapedString allRangesOfRegexMatches: assoc key.
		keywordRanges do: [:each | 
			sortedRanges add: (
				SHRange
					start: each first
					end: each last
					type: assoc value)]].
	^ sortedRanges asOrderedCollection