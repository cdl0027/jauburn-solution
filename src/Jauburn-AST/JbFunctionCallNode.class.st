Class {
	#name : #JbFunctionCallNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'arguments'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionCallNode >> arguments [
	^ arguments
]

{ #category : #accessing }
JbFunctionCallNode >> arguments: anObject [
	arguments := anObject
]

{ #category : #api }
JbFunctionCallNode >> evaluateIn: environment [
	| eval_args |
	"arguments begin as JbConstantExpressionNode"
	Transcript show: '-------- JbFunctionCallNode>>evaluateIn: --------'; cr.
	Transcript show: environment printString; cr.
	Transcript show: self identifier printString; cr.
	Transcript show: self arguments printString; cr.
	
	eval_args := arguments collect: [ :e | e evaluateIn: environment ].
	Transcript show: ((environment at: identifier) call: eval_args in: environment) printString; cr.
	^ (environment at: identifier) call: eval_args in: environment
]

{ #category : #accessing }
JbFunctionCallNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbFunctionCallNode >> identifier: anObject [
	identifier := anObject
]
