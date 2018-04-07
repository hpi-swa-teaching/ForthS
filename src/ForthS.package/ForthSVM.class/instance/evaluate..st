evaluation
evaluate: aString

	| output |
	self inputBuffer: aString.
	self running: false.
	self execute: (self tick: 'quit').
	output := self outputBuffer.
	self outputBuffer: ''.
	^ output