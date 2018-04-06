initialization-defaults
initializeFORTH
		<String>
	CODE IMMEDIATE 
		self memory 
			at: self dictionaryPointer + self immediateOffset 
			put: true 
	END
	CODE ( [ self nextWord ~= ')' ] whileTrue: [] END IMMEDIATE

		( POINTERS )
	CODE HERE self data push: self dictionary pointer END
	CODE PAD self data push: self dictionary pointer + 100 END
	CODE NULL self data push: self null END
	CODE NIL self data push: nil END


		( VARIABLE ACCESS )
	CODE ! "Stores a value into an adress"
		| adress |
		adress := self data pop. "Not sure if I can do it in one call?"
		self memory at: adress put: self data pop
	END
	CODE @ self data push: (self memory at: self data pop) END




		( ARITHMETICS )
	CODE * self data push: self data pop * self data pop. END
	CODE + self data push: self data pop + self data pop. END
	CODE - 
		| op1 op2 |
		op1 := self data pop.
		op2 := self data pop.
		self data push: op2 - op1 "Note the reversion of op2 and op1 in the final operation!"
	END
	CODE /
		| op1 op2 |
		op1 := self data pop.
		op2 := self data pop.
		self data push: op2 / op1
	END


		( Boolean operators )
	CODE true self data push: true END
	CODE false self data push: false END
	CODE < 
		| op1 op2 |
		op1 := self data pop.
		op2 := self data pop.
		self data push: op2 < op1
	END
	CODE <=
		| op1 op2 |
		op1 := self data pop.
		op2 := self data pop.
		self data push: op2 <= op1
	END
	CODE >
		| op1 op2 |
		op1 := self data pop.
		op2 := self data pop.
		self data push: op2 > op1
	END
	CODE >=
		| op1 op2 |
		op1 := self data pop.
		op2 := self data pop.
		self data push: op2 >= op1
	END
	CODE = self data push: self data pop = self data pop END
	CODE ~= self data push: self data pop ~= self data pop END
	CODE NOT self data push: self data pop not END



		( MANIPULATING RETURN STACK )
	CODE >R self return push: self data pop END
	CODE R> self data push: self return pop END
	CODE R@ self data push: self return top END



		( MANIPULATING DATA STACK )
	CODE DROP self data pop END
	CODE DUP self data push: self data top END
	CODE OVER self data push: (self data at: 2) END
	CODE PICK self data push: (self data at: self data pop) END
	CODE SWAP 
		| op1 op2 |
		op1 := self data pop.
		op2 := self data pop.
		self data push: op1.
		self data push: op2
	END



		( OUTPUT ) 
	CODE . self outputBuffer: self outputBuffer , self data pop END
	CODE SPACE self outputBuffer: self outputBuffer , Character space END
	CODE CR self outputBuffer: self outputBuffer , Character cr END



		( Debugging )
	CODE HALT self halt END

		( All code and definitions necessary to define : and ; )
	CODE CREATE 
		self 
			createWordHeader: self nextWord 
			isPrimitive: false 
			isImmediate: false 
	END
	CODE , self dictionary push: self data pop END
	CODE FIND self data push: (self find: self nextWord) END
	CODE IMMEDIATE? self data push: (self isImmediateWord: self data pop) END

	CODE NextWord self data push: self nextWord END
	CODE DupInput 
		|buffer| 
		buffer := self nextWord.
		self inputBuffer: buffer, Character space, buffer, Character space, self inputBuffer
	END

	CODE NUMBER self data push: (self number: self nextWord) END
	CODE COMPILEDLITERAL 
		self data push: (self memory at: self programCounter). 
		self programCounter: self programCounter + 1 
	END

	CODE ' self data push: (self tick: self nextWord) END

	CODE COMPILING self data push: self compilingFlagAdress end

	CODE LOADINTERPERTER 
		self loadDictionaryFromStream: self interpreterDict readStream 
	END
	LOADINTERPERTER



		( INTERPRETER WORDS )
	: COMPILE 
		[ ' COMPILEDLITERAL ] LITERAL , 
		' , 
		[ ' , ] LITERAL , 
	; IMMEDIATE

	: ['] 
		COMPILE COMPILEDLITERAL 
		' ,
	; IMMEDIATE

		( Program flow words )
	: IF ( -- addr ) 
		COMPILE COMPILEDIF
		HERE ( Put HERE on the stack for ELSE/THEN )
		NULL HERE - , ( Create a Jump to an invalid adress to create a deliberate Error, if no ELSE/THEN is found )
	; IMMEDIATE

	: THEN
		DUP HERE 1 + SWAP - ( Calculate distance to IF )
		SWAP !	( Store the jump distance )
	; IMMEDIATE

	: ELSE
		COMPILE JUMP
		HERE SWAP ( Put the Adress for THEN on the stack and swap to get access to the one put on by IF )
		NULL HERE - , ( Store invalid jump for the case that there is no THEN )
		DUP HERE 1 + SWAP -
		SWAP !
	; IMMEDIATE

	: POSTPONE
		DupInput
		' IMMEDIATE?
			IF ' ,
			ELSE [ ' COMPILE , ]
		THEN
	; IMMEDIATE



		( Convenience functions )
	: 1+ 1 + ;
	: 2+ 2 + ;
	: 1- 1 - ;
	: 2- 2 - ; 


		( Loops )
	: DO
		POSTPONE >R
		POSTPONE >R
		HERE ( Put the adress for +LOOP/LOOP on the stack so it knows where to jump )
	; IMMEDIATE

	: LOOP ( addr -- )
		COMPILE R>
		COMPILE R>
		COMPILE 1+
		( put the index and count back on the return stack )
		COMPILE OVER
		COMPILE OVER
		COMPILE >R
		COMPILE >R
		COMPILE >
		COMPILE NOT
		COMPILE COMPILEDIF
		HERE 1- - ,
	; IMMEDIATE

	: BEGIN ( -- addr )
		HERE
	; IMMEDIATE

	: UNTIL ( addr -- )
		HERE -
		COMPILE COMPILEDIF
		,
	; IMMEDIATE

	: WHILE ( -- addr )
		POSTPONE IF
	; IMMEDIATE
	
	: REPEAT ( beginAddr whileAddr -- )
		( Jump back to beginning )
		SWAP
		HERE -
		COMPILE JUMP
		,
	
		( Tell while where to jump if it skips the loop )
		POSTPONE THEN
	; IMMEDIATE

	CODE i self data push: (self return at: 2) END


		( Variables )
	: VARIABLE
		CREATE
		COMPILE COMPILEDLITERAL
		HERE 3 + ,
		COMPILE EXIT
		NIL ,
		0 , ( The actual storage space )
	; IMMEDIATE

		( Strings )
	CODE readString
		| index |
		index := self inputBuffer indexOf: $".
		self data push: (self inputBuffer first: index - 1).
		self inputBuffer: (self inputBuffer allButFirst: index)
	END

	: ." 
		readString POSTPONE LITERAL
		COMPILE .
	; IMMEDIATE