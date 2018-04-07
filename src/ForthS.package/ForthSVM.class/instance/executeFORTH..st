FORTH execution
executeFORTH: aPointer
	
	self running 
		ifTrue: [self return push: self programCounter - 1].
	self programCounter: aPointer + self codeOffset.
	"If we are already running, let our outer loop handle everything.
	Therefore, just update our programCounter, push to return stack and return"
	self running ifTrue: [ ^ self ].
	self running: true.
	
	[ self memory at: self programCounter]
		whileNotNil: [
			"Changing of the program counter shall be done before executing the word, so that eventuall changes of the program counter during FORTH execution don't get reversed"
			self programCounter: self programCounter + 1.
			self execute: (self memory at: self programCounter - 1)].
	
	"Return stack should be cleared anyway by the program, but make sure it actually is to not leave the VM in an inconsistent state, if the FORTH code is faulty."
	self return clear.
	self running: false