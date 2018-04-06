parse
rangesIn: aString classOrMetaClass: aClass workspace: workspace environment: environment
	"Just disable syntax highlighting, if its a String method"
	(aString matchesRegex: '.+<String>.+')
		ifTrue: [^ OrderedCollection new ]
		ifFalse: [
			^ super 
				rangesIn: aString 
				classOrMetaClass: aClass 
				workspace: workspace 
				environment: environment]