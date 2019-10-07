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
	"Transcript show: '-------- JbIfElseNode>>executeIn: --------'; cr.
	Transcript show: (self condition evaluateIn: environment) printString;	cr.
	self trueStatements	do: [ :s | Transcript show: s printString; cr ].
	self falseStatements do: [ :s | Transcript show: s printString; cr. ].
	"	
	testVal := self condition evaluateIn: environment.			
	^ testVal ifTrue: [ self trueStatements do: [ :s | s executeIn: environment ] ]
			  ifFalse: [ self falseStatements do: [ :s | s executeIn: environment ] ].
]

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
