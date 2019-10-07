Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser',
		'inner',
		'outer'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 
	"Added environment [inner, outer]"
	outer := JbEnvironment new.
	inner := JbEnvironment new.
	inner outerEnvironment: outer.
	
	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #tests }
JbInterpreterTest >> testArity1Operator [
	
	self interpret: 'var x = -3;'.
	self assert: (interpreter environment at: 'x') equals: -3.

]

{ #category : #tests }
JbInterpreterTest >> testArity2Operator [
	
	self interpret: 'var x = 3 - 2;'.
	self assert: (interpreter environment at: 'x') equals: 1.
	self interpret: 'var x = 3 + 2;'.
	self assert: (interpreter environment at: 'x') equals: 5.
	self interpret: 'var x = 3 * 2;'.
	self assert: (interpreter environment at: 'x') equals: 6.
	self interpret: 'var x = 6 / 2;'.
	self assert: (interpreter environment at: 'x') equals: 3.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCall [
	
	self interpret: 'var x = function(a, b, c) { return a + b + c; }; var y = x(1, 2, 3);'.
	self assert: (interpreter environment at: 'y') equals: 6.
]

{ #category : #tests }
JbInterpreterTest >> testFunctionDefinition [
	
	self interpret: 'var x = function(a, b, c) {};'.
	self assert: (interpreter environment at: 'x') parameters size equals: 3.
	self assert: (interpreter environment at: 'x') body size equals: 0.
	self assert: (interpreter environment at: 'x') environment equals: interpreter environment.
	
	self interpret: 'var x = function(a, b, c) { a = 0; };'.
	self assert: (interpreter environment at: 'x') parameters size equals: 3.
	self assert: (interpreter environment at: 'x') body size equals: 1.
	self assert: (interpreter environment at: 'x') environment equals: interpreter environment.
]