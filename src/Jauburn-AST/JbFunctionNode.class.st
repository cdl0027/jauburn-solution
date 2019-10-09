Class {
	#name : #JbFunctionNode,
	#superclass : #Object,
	#instVars : [
		'name',
		'body',
		'parameters'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionNode >> body [
	^ body
]

{ #category : #accessing }
JbFunctionNode >> body: anObject [
	body := anObject
]

{ #category : #api }
JbFunctionNode >> evaluateIn: environment [
"	Transcript show: '-------- JbFunctionNode>>evaluateIn: --------'; cr.
	Transcript show: environment printString; cr.
	Transcript show: self name printString; cr.
	Transcript show: self parameters printString; cr.
	Transcript show: self body printString; cr."
	^JbFunction new
		parameters: self parameters;
		body: self body;
		environment: environment;
		yourself.
]

{ #category : #accessing }
JbFunctionNode >> name [
	^ name
]

{ #category : #accessing }
JbFunctionNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
JbFunctionNode >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunctionNode >> parameters: anObject [
	parameters := anObject
]
