parse
rangesIn: aString classOrMetaClass: aClass workspace: workspace environment: environment
	"Just disable syntax highlighting, if its a FORTH method"
	^ (aString matchesRegex: '.+<FORTH>.+')
		ifTrue: [self forthRanges: aString]
		ifFalse: [
			super 
				rangesIn: aString 
				classOrMetaClass: aClass 
				workspace: workspace 
				environment: environment]