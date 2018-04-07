A FORTHParser is a syntax highlighter for FORTH code.
To enable syntax highlighting in a class, override its class method #shoutParserClass to return FORTHParser. (For an example see FORTHObject)
Syntax highlighting will only be enabled when the keyword <FORTH> is found in a mehod, otherwise normal Syntax highlihgting will be used.