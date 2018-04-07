compilation
compile: textOrStream in: aClass environment: anEnvironment notifying: aRequestor ifFail: failBlock
	
	^ super
		compile: (self precompile: textOrStream)
		in: aClass
		environment: anEnvironment
		notifying: aRequestor
		ifFail: failBlock