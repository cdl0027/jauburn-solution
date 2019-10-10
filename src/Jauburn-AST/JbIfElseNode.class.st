Class {
	#name : #JbIfElseNode,
	#superclass : #JbIfNode,
	#instVars : [
		'falseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #api }
JbIfElseNode >> executeIn: environment [
	"if test was true, JbIfNode>>executeIn: otherwise JbIfElseNode>>executeIn:"
	| testVal |
	testVal := self condition evaluateIn: environment.			
	^ testVal ifTrue: [ self trueStatements collect: [ :s | s executeIn: environment ] ]
			  ifFalse: [ self falseStatements collect: [ :s | s executeIn: environment ] ].
]

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
