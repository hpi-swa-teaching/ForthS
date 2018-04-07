FORTH primitives
number: aString

	^ [aString asNumber] 
		on: Error 
		do: [self error: 'Input: "', aString, '" is neither Word nor Number!']