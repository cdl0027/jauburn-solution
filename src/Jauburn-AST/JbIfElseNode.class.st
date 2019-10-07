Class {
	#name : #JbIfElseNode,
	#superclass : #JbIfNode,
	#instVars : [
		'falseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #'as yet unclassified' }
JbIfElseNode >> executeIn: environment [
"if test was true, JbIfNode>>executeIn: otherwise JbIfElseNode>>executeIn:"
	^self falseStatements do: [ :s | s executeIn: environment ]
]

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
