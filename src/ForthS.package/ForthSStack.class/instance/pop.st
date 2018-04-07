removing
pop

	| top |
	top := self top.
	self pointer: self pointer - 1.
	^ top