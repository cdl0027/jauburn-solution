Extension { #name : #JbVariableDeclarationStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbVariableDeclarationStatementNode >> executeIn: environment [
"	Transcript show: '-------- JbVariableDeclarationStatementNode>>executeIn: --------'; cr.
	Transcript show: environment printString; cr.
	Transcript show: identifier printString; cr.
	Transcript show: expression printString; cr."

	environment at: self identifier put: (self expression evaluateIn: environment)
]
