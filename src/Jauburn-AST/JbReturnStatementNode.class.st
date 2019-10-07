Class {
	#name : #JbReturnStatementNode,
	#superclass : #Object,
	#instVars : [
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbReturnStatementNode >> evaluateIn: anEnvironment [
	Transcript show: ((anEnvironment at: 'x') parameters first) identifier printString; cr.
	
	^self expression
]

{ #category : #accessing }
JbReturnStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbReturnStatementNode >> expression: anObject [
	expression := anObject
]
