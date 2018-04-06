initialization-defaults
interpreterDict
	<String>
	']'
	false
	false
	self tick: 'COMPILEDLITERAL'
	true
	self tick: 'COMPILING'		"Compiling Flag will be changed by ["
	self tick: '!'
	self tick: 'COMPILING'		"If we are not compiling, jump away"
	self tick: '@'
	self tick: 'CompiledIF'
	29
	self tick: 'DupInput'
	self tick: 'FIND'
	self tick: 'DUP'
	self tick: 'NULL'
	self tick: '~='
	self tick: 'CompiledIF'				"Whether it is a valid word"
	14
	self tick: 'nextWord' "Drop duplicated input"
	self tick: 'DROP'
	self tick: 'DUP'
	self tick: 'IMMEDIATE?'
	self tick: 'CompiledIF'				"Whether the word is immediate"
	5
	self tick: 'EXECUTE'				"Execute the immediate word"
	self tick: 'JUMP'
	3
	self tick: ','						"Push non-immediate word into the dictionary"
	self tick: 'JUMP'
	8
	self tick: 'DROP'
	self tick: 'NUMBER'					"The Input is a number"
	self tick: 'COMPILEDLITERAL'
	self tick: 'COMPILEDLITERAL'
	self tick: ','
	self tick: ','
	self tick: 'JUMP' 					"Loop up again"
	-29

	':'
	false
	false
	self tick: 'CREATE'
	self tick: ']'

	'['
	false
	true
	self tick: 'COMPILEDLITERAL'
	false
	self tick: 'COMPILING'
	self tick: '!'

	';'
	false
	true
	self tick: 'COMPILEDLITERAL'  "Push EXIT to the end of the word"
	self tick: 'EXIT'
	self tick: ','
	self tick: 'NIL'
	self tick: ','
	self tick: '['

	'LITERAL'
	false
	true
	self tick: 'COMPILEDLITERAL'
	self tick: 'COMPILEDLITERAL'
	self tick: ','
	self tick: ','