A FORTHObject is an abstract superclass similar to Object.
It enables all subclasses to write Forth code in normal methods by adding <FORTH> before the methods content. In these methods a rudimentary Forth syntax highlighting is also enabled.
Any Forth code will be executed in a FORTHVM instance that is unique for every FORTH object (Be aware though, that this makes FORTHObject instances multiple kilobytes in size, even if they are empty)
The FORTHVM the FORTHObject uses is a copy of the global FORTHVM instance. This enables a persistent Forth state, as any code changes inside the global FORTHVM instance will be distributed to all new instances of FORTHObject. Any existing FORTHObject instances will not receive these updates though.
It is important that all subclasses call the FORTHObject>>#initialize method before using any Forth method (in general by calling "super initialize" in the subclasses initialize method).
It is also possible to send Forth code directly to an existing instance of a FORTHObject by sending it FORTHObject>>#evaluate: the parameter being the FORTH code as a string.

For an example of how to use FORTHObject, see FORTHGuessingGame.


Instance Variables
	forthVM:		<FORTHVM>

forthVM
	- The FORTHVM instance to use for Forth execution
