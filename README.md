# ForthS

## Project Description
A simplified implementation of the Forth Language in Squeak/Smalltalk.

This project was created during winter semester 17/18 as part of the *Programming Languages: Design and Implementation* seminar at the Hasso-Plattner-Institut by Leon Matthes.

## Installation instruction
To install the Packages into your image, you should first install [Metacello](https://github.com/Metacello/metacello).

Then run the following command:
```smalltalk
Metacello new
  baseline: 'ForthS';
  repository: 'github://hpi-swa-teaching/ForthS:master/src';
  load.
```

## Usage introduction
The two most important classes in ForthS are ForthSVM and ForthObject.

### ForthSVM class
ForthSVM instances are responsible for executing FORTH code and saving the associated data.
You can pass FORTH code to any instance of ForthSVM via the ForthSVM>>#evaluate: message.
The message will return the output of your FORTH code as a string.

For example: 
```smalltalk
FortSVM new evaluate: '10 23 + .'
```
will return: `'33'`.

Please note that creating a ForstSVM instance may take a few seconds, this can be avoided by using veryDeepCopy to copy an existing instance.

In the spirit of using a persistent VM (similar to Squeak), ForthS also keeps a global ForthSVM instance, which can be accessed via: `ForthSVM globalInstance`.
This global VM allows you to have a persistent FORTH state, which you can access from anywhere.

How to use the global instance:
```smalltalk
ForthSVM globalInstance evaluate: '10 23 + .'. "Output: '33'"
ForthSVM evaluate: '10 23 + .'. "Shorthand for the above command"
ForthSVM evaluate: ': Hello ." Hello World!" ;'. "Defines the word hello in the global state"
ForthSVM evaluate: 'Hello'. "Output: 'Hello World!'"
ForthSVM save. "Saves the state of the global VM to be restored later"
ForthSVM load. "Load the saved version"
ForthSVM reset. "Resets the global ForthSVM instance to its initial state"
```

### ForthSObject class
ForthSObjects are Objects that can execute Forth code in two different ways:
1. Creating an instance and calling: `ForthSObject>>#evaluate:`
2. Subclassing from ForthSObject and using `<FORTH>` to write Forth code directly
   1. Create a new Subclass of ForthSObject
   2. In this subclass, create a new method
   3. In the second line of the method definition add the tag `<FORTH>`
   4. Write FORTH code instead of smalltalk code (syntax highlighting included)
      For an example of how to use `<FORTH>` look at the ForthSGuessingGame class in the ForthS-Example package.

Please note, that all ForthSObjects create a copy of the global ForthSVM instance, when their FORTH capability is first used. 
Therefore they will also copy any words that have been added to the global ForthSVM's dictionary.
This has been done in an effort to emulate a persistent system, similar to Squeak itself.

## Documentation
The code is documented using Squeaks class comments.

It is recommended to start reading the class comment of ForthSVM first.

## ForthS and version control
Because ForthS offers the `<FORTH>` and `<String>` macros, it changes the compilerClass of a few other classes.
This can lead to problems when migrating any code using those two tags from one image to another.

To remove any unwanted Compiler Errors during import please make sure that.. 
* ..ForthS has been imported in the right order (as defined in BaselineOfForthS).
* ..Any of your code that uses `<FORTH>` or `<String>` gets imported AFTER the compilerClass method is imported.
  e.g. make sure that any classes that inherit from ForthSObject are in a different package than ForthSObject and make sure this package gets imported after the ForthS-Object package.
