Extension { #name : #JbConstantExpressionNode }

{ #category : #'*Jauburn-Interpreter' }
JbConstantExpressionNode >> evaluateIn: environment [
"	Transcript show: '-------- JbConstantExpressionNode>>evaluateIn: --------'; cr.
	Transcript show: environment printString; cr.	
	Transcript show: value printString; cr.
"
	^self value
]
