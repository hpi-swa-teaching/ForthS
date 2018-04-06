compilation
createMethodBody: aStringStream

	^ self prefix, (self escapeString: aStringStream upToEnd), self suffix