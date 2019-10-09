Class {
	#name : #JbAssignmentStatementNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbAssignmentStatementNode >> executeIn: environment [
"	Transcript show: '-------- JbAssignmentStatementNode>>executeIn: --------'; cr.
	Transcript show: environment printString; cr.	
	Transcript show: identifier printString; cr.
	Transcript show: expression printString; cr."

	environment
		at: self identifier
		put: (self expression evaluateIn: environment)
]

{ #category : #accessing }
JbAssignmentStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbAssignmentStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
JbAssignmentStatementNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbAssignmentStatementNode >> identifier: anObject [
	identifier := anObject
]
