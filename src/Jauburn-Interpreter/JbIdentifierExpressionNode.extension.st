Extension { #name : #JbIdentifierExpressionNode }

{ #category : #'*Jauburn-Interpreter' }
JbIdentifierExpressionNode >> evaluateIn: environment [ 
"	Transcript show: '-------- JbIdentiferExpressionNode>>evaluateIn: --------'; cr.
	Transcript show: environment printString; cr.
	Transcript show: identifier printString; cr."

	^environment at: self identifier
]
