accessing
push: anObject

	self memory at: self pointer put: anObject.
	self pointer: self pointer + 1