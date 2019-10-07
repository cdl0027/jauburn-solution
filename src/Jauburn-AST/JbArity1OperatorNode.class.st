Class {
	#name : #JbArity1OperatorNode,
	#superclass : #Object,
	#instVars : [
		'operator',
		'operand'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbArity1OperatorNode >> evaluateIn: environment [
	| val |
	Transcript show: '-------- JbArity1OperatorNode>>evaluateIn: --------'; cr.
	Transcript show: environment printString; cr.	
	Transcript show: operand printString; cr.
	Transcript show: operator printString; cr.
	
	val := self operand evaluateIn: environment.
	self operator = $-
		ifTrue: [ ^0 - val ]
]

{ #category : #accessing }
JbArity1OperatorNode >> operand [
	^ operand
]

{ #category : #accessing }
JbArity1OperatorNode >> operand: anObject [
	operand := anObject
]

{ #category : #accessing }
JbArity1OperatorNode >> operator [
	^ operator
]

{ #category : #accessing }
JbArity1OperatorNode >> operator: anObject [
	operator := anObject
]
