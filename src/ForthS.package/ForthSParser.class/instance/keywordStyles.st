parse
keywordStyles

	^ {
		'IF|ELSE|THEN|OVER|ROT|DUP|DROP|PICK|HERE|PAD|NULL|NIL|DO|LOOP|BEGIN|UNTIL|WHILE|REPEAT|' -> #globalVar.
		'<|>|=|~=|<=|>=|!|@|\+|\-|\*|\/|NOT' -> #methodArg.
		'\:|\;|VARIABLE' -> #pragmaUnary.
		'\( [^,\)]*\)' -> #comment.
		'\." [^,"]*"' -> #string.
		'\d+(\.\d+)?' -> #instVar}