A StringCompiler is a Compiler, that enables methods to return their contents as a string.
This is done by replacing the text of a method, before it is compiled by the default Squeak Compiler.
To enable a method to be returned as a string, add <String> to the method, any content after this line will be treated and returned as a string.

To use a StringCompiler in a class, override its class method: #compilerClass to return the StringCompiler class.

Warning: when writing methods with <String> this might lead to problems with fileOuts, the order of the methods which use <String> must be changed, so they are after the definition of the compilerclass override, otherwise <String>  will produce a syntax error.