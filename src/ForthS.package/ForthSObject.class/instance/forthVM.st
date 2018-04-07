accessing
forthVM

	forthVM ifNil: [self forthVM: ForthSVM globalInstance veryDeepCopy].
	^ forthVM