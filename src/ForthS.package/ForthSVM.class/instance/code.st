FORTH primitives
code
	"CODE is a FORTH word which defines a new FORTH word written in the primitive language.
	Usually assembler, but in this case smalltalk."
	| body nextWord |
	self 
		createWordHeader: self nextWord
		isPrimitive: true
		isImmediate: false.
	
	body := String new.
	[ nextWord := self nextWord. nextWord asLowercase ~= 'end' ]
		whileTrue: [ body := body, Character space, nextWord ].
	
	self dictionary push: body.
	self dictionary push: nil