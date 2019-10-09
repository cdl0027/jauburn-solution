Class {
	#name : #JbWhileLoopNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'whileStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbWhileLoopNode >> condition [
	^ condition
]

{ #category : #accessing }
JbWhileLoopNode >> condition: anObject [
	condition := anObject
]

{ #category : #api }
JbWhileLoopNode >> executeIn: environment [
	"test condition -> loop and execute trueStatements"

"	Transcript show: '-------- JbWhileLoopNode>>executeIn: --------'; cr.
	Transcript show: environment; cr.
	Transcript show: condition; cr.
	whileStatements do: [ :s | Transcript show: s printString; cr ]."
	
	^(condition evaluateIn: environment) ifTrue: [ whileStatements do: [ :e | e executeIn: environment ]. self executeIn: environment. ].
	
	
]

{ #category : #accessing }
JbWhileLoopNode >> whileStatements [
	^ whileStatements
]

{ #category : #accessing }
JbWhileLoopNode >> whileStatements: anObject [
	whileStatements := anObject
]
