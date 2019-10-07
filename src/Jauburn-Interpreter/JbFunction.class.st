"
I am the value that results from evaluating a function.  My i-vars

	parameters -- collection holding names of my parameters 
	environment -- a JbEnvironment instance holding the environment in effect when I was created (closures!)
	body -- an AST node for the body of this function
"
Class {
	#name : #JbFunction,
	#superclass : #Object,
	#instVars : [
		'body',
		'parameters',
		'environment'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
JbFunction >> body [
	^ body
]

{ #category : #accessing }
JbFunction >> body: anObject [
	body := anObject
]

{ #category : #api }
JbFunction >> call: arguments in: callEnvironment [
	"You need to implement this method!  arguments will contain the arguments to pass to this function and callEnvironment will contain the environment in place when this function was called."

	| appEnv val |
	Transcript show: '-------- JbFunction>>call:in: --------'; cr.
	Transcript show: environment; cr.
	Transcript show: callEnvironment; cr.
	Transcript show: arguments printString; cr.
	
	
	appEnv := JbEnvironment	newFromKeys: parameters	andValues: arguments.
	appEnv outerEnvironment: callEnvironment.
	
	Transcript show: appEnv; cr.
	
	body do: [ :e | Transcript show: e printString; cr. ].
	val := body collect: [ :e | e executeIn: environment ].

	Transcript show: val printString; cr.

	^ appEnv
]

{ #category : #accessing }
JbFunction >> environment [
	^ environment
]

{ #category : #accessing }
JbFunction >> environment: anObject [
	environment := anObject
]

{ #category : #accessing }
JbFunction >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunction >> parameters: anObject [
	parameters := anObject
]
