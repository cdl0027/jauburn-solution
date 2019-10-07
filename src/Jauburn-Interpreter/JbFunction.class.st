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

	| app_env result |
	Transcript show: '-------- JbFunction>>call:in: --------'; cr.
	Transcript show: environment; cr.
	Transcript show: callEnvironment; cr.
	Transcript show: arguments printString; cr.
	Transcript show: parameters printString; cr.
	
	app_env := JbEnvironment newFromKeys: (parameters collect: [ :s | s identifier ]) andValues: arguments.
	result := body collect: [ :e | e executeIn: app_env ].
	result := result last.
	
	Transcript show: app_env; cr.
	Transcript show: result; cr.
	
	^result
	
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
