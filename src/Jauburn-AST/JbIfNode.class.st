Class {
	#name : #JbIfNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'trueStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIfNode >> condition [
	^ condition
]

{ #category : #accessing }
JbIfNode >> condition: anObject [
	condition := anObject
]

{ #category : #api }
JbIfNode >> executeIn: environment [
	"test condition -> loop and execute trueStatements"

	| testVal |
"	Transcript show: '-------- JbIfNode>>executeIn: --------'; cr.
	Transcript show: (self condition evaluateIn: environment) printString;	cr.
	self trueStatements	do: [ :s | Transcript show: s printString; cr ]."
	
	testVal := self condition evaluateIn: environment.			
	^ testVal ifTrue: [ self trueStatements do: [ :s | s executeIn: environment ] ].
]

{ #category : #accessing }
JbIfNode >> trueStatements [
	^ trueStatements
]

{ #category : #accessing }
JbIfNode >> trueStatements: anObject [
	trueStatements := anObject
]
