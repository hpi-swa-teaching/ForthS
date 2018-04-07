A FORTHVM is a virtual machine that executes Forth code.
A FORTHVM can be used in several ways.
	- Creating a new instance of FORTHVM and calling FORTVHM>>#evaluate: with the parameter being Forth code as a string
	- Using the global instance by calling the class method FORTHVM>>#evaluate: the parameter again being Forth code as a string.
	  This will use a global instance of the FORTHVM which is persistent and therefore over time accumulates more functionality
	- Inheriting from FORTHObject and writing a method with the <FORTH> pragma, which allows for writing Forth code directly in a method (See FORTHObject for further detail).

Warning: creating a new instance of FORTHVM via FORTHVM>>#new may take several seconds, therefore it might be better to copy the globalInstance of the FORTHVM class via a veryDeepCopy (it is important to use a veryDeepCopy, as a deepCopy would destroy the associations between the FORTHStacks and their memory). Keep in mind though, that this will also copy any new words that have been defined in the global FORTHVM instance which might be an undesired side effect.

About the global instance:
The FORTHVM class has a global FORTHVM instance. This is done to mirror how the Squeak virtual machine is also a persistent system that can be extended over time.
The state of the global instance can also be saved/loaded via the according class methods FORTHVM>>#save and FORTHVM>>#load to recover from critical errors in the VM

About this Forth implementation:
Most of the Forth words are implemented in the method FORTHVM>>#initializeFORTH in Forth code.
Many of the Forth words have been adopted for better compatability with Smalltalk, for example:
	- Any position in memory can contain any Smalltalk object, therefore strings can be saved directly directly at a single memory adress
	- Arithmetic operations no work on Smalltalk numbers, therefore there is no Over-/Underflow and floating points operations are enabled (therefore there are also no double-sized integers)
	- The CODE word has been changed to accept Smalltalk code up to the END word, instead of being defined by Assembler
	- Not all Forth words of the FORTH-83 Standard are implemented (again, see FORTHVM>>#initializeFORTH for the implemented words)
	- The dictionary and the memory is technically unlimited (except for the limits of the squeak image). Trying to access any adress in memory that is out of bounds will extend the memories size to fit.


About the dictionary:
The FORTH dictionary is the place in memory, in which the FORTHVM saves all defined words.
A dictionary entry follows the convention:
1.	Name of the word as a string
2.	Pointer to the previous word (This will create a linked list)
3.	Primitive Boolean (Whether the words content is smalltalk code or FORTH code)
4.	Immediate Boolean (Whether the word will be executed at compile time)
	The content of the word (Either a single string of smalltalk code if the Primitive boolean is true or a list of pointers to other FORTH words otherwise.)
	nil (Every dictionary must be ended with a nil as the delimiter! The FORTHVM will stop execution once it reaches nil)


Instance Variables
	memory:		<DynamicArray>
	data:		<FORTHStack>
	dictionary:		<FORTHStack>
	return:		<FORTHStack>
	running:		<Boolean>

memory
	- The memory which the whole VM operates on
	- Everything in memory is reachable via FORTH code
	
data
	- The FORTHStack which represents the data stack

dictionary
	- The FORTHStack which represents the dictionary

return
	- The FORTHStack which represents the return stack

running
	- This Boolean signals to the main loop of the VM (FORTHVM>>#executeFORTH:) whether it is already started
