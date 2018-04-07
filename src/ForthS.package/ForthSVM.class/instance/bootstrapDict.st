initialization-defaults
bootstrapDict
	<String>
	'EXECUTE'
	true	"Whether the word is a primitive (ST Code)"
	false	"Whether it is a compile-time word"
	'self execute: self data pop.'
			"Empty line to end word body"
	'EXIT'
	true
	false
	'(self return isEmpty) ifFalse: [self programCounter: (self return pop + 1)].'

	'INTERPRET'
	true
	false
	'self interpret: self nextWord.'

	'ClearReturn'
	true
	false
	'self return clear'

	'INPUT?'
	true
	false
	'self data push: (self inputBuffer size > 0)'

	'COMPILEDIF'
	true
	false
	'(self data pop) ifTrue: [ self programCounter: self programCounter + 1] ifFalse: [self programCounter: self programCounter - 1 + (self memory at: self programCounter)]'

	'JUMP'
	true
	false
	'self programCounter: self programCounter - 1 + (self memory at: self programCounter)'

	'QUIT'
	false
	false
	self tick: 'ClearReturn'
	self tick: 'INPUT?'
	self tick: 'COMPILEDIF'
	5 "Offset for the compiledIF to jump to."
	self tick: 'INTERPRET'
	self tick: 'JUMP' "Create an endless loop!"
	-4

	'CODE'
	true
	false
	'self code'