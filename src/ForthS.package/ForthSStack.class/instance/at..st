accessing
at: anIndex

	self size < anIndex
		ifTrue: [self errorStackUnderflow].
	^ self memory at: self pointer - anIndex