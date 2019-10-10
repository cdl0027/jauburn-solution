Class {
	#name : #JbReturnStatementNode,
	#superclass : #Object,
	#instVars : [
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbReturnStatementNode >> executeIn: environment [
"	Transcript show: '-------- JbReturnStatementNode --------'; cr.
	Transcript show: environment printString; cr.
	Transcript show: (self expression evaluateIn: environment) printString; cr."
	^self expression evaluateIn: environment
]

{ #category : #accessing }
JbReturnStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbReturnStatementNode >> expression: anObject [
	expression := anObject
]
