initialization
initializeFORTH
	<FORTH>
	
	VARIABLE secret
	: set-secret ( n -- )
		secret !
	;

	: below ." You guessed too low!" ;
	: above ." You guessed too high!" ;
	: correct ." You guessed correct!" ;

	: guess ( n -- )
		secret @ OVER OVER >
		IF above DROP DROP
		ELSE <
			IF below
			ELSE correct
			THEN
		THEN
	;