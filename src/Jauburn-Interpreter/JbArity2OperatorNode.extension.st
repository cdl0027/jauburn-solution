Extension { #name : #JbArity2OperatorNode }

{ #category : #'*Jauburn-Interpreter' }
JbArity2OperatorNode >> evaluateIn: environment [

	| lhsValue rhsValue |
"	Transcript show: '-------- JbArity2OperatorNode>>evaluateIn: --------'; cr.
	Transcript show: environment printString; cr.	
	Transcript show: lhs printString; cr.
	Transcript show: rhs printString; cr.
	Transcript show: operator printString; cr."
	
	lhsValue := self lhs evaluateIn: environment.
	rhsValue := self rhs evaluateIn: environment.
	
"	Transcript show: lhsValue printString; cr.
	Transcript show: rhsValue printString; cr."
		
	self operator = $*
		ifTrue: [ ^lhsValue * rhsValue ].
	self operator = $+
		ifTrue: [ ^lhsValue + rhsValue ].
	self operator = $-
		ifTrue: [ ^lhsValue - rhsValue ].
	self operator = $/
		ifTrue: [ ^lhsValue / rhsValue ].
	self operator = '=='
		ifTrue: [ ^lhsValue = rhsValue ].
	self operator = '<'
		ifTrue: [ ^lhsValue < rhsValue ].
	self operator = '<='
		ifTrue: [ ^lhsValue <= rhsValue ].
	self operator = '>'
		ifTrue: [ ^lhsValue > rhsValue ].
	self operator = '>='
		ifTrue: [ ^lhsValue >= rhsValue ].
	self operator = '!='
		ifTrue: [ ^lhsValue ~= rhsValue ]
		
	
]
