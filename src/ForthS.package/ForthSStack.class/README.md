A FORTHStack is a helper construct for the FORTHVM.
It simulates a stack that is saved in the same memory, that the FORTHVM uses. This allows the VM to save all stacks in the same memory, therefore they can be manipulated from FORTH code.

Instance Variables
	defaultPointer:		<anInteger>
	memory:		<aDynamicArray>
	pointerAdress:		<anInteger>

defaultPointer
	- The value of the stackpointer, if the stack is empty
	- used when clearing the stack

memory
	- the memory the stack operates on

pointerAdress
	- adress of the stackpointer in memory
