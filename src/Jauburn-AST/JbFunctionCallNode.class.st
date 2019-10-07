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
JbFunctionCallNode >> evaluateIn: anEnvironment [
	| eval_args |
	"arguments begin as JbConstantExpressionNode"
	Transcript
		show: self arguments printString;
		cr.
	eval_args := arguments collect: [ :e | e evaluateIn: anEnvironment ].
	Transcript
		show: eval_args printString;
		cr.

	"determine type -> return JbFunction"
	Transcript
		show: self identifier printString;
		cr.
	^ (anEnvironment at: identifier) call: eval_args in: anEnvironment
]

{ #category : #accessing }
JbFunctionCallNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbFunctionCallNode >> identifier: anObject [
	identifier := anObject
]
