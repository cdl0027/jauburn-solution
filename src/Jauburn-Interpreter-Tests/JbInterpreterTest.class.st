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
JbInterpreterTest >> testAbsBinding [

	self interpret: 'var x = abs(-100);'.
	self assert: (interpreter environment at: 'x') equals: 100.
	self interpret: 'var x = abs(0);'.
	self assert: (interpreter environment at: 'x') equals: 0.
	self interpret: 'var x = abs(200);'.
	self assert: (interpreter environment at: 'x') equals: 200.
	
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
	
	"boolean operators"
	self interpret: 'var x = 3 == 3;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = 1 < 3;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = 1 <= 3;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = 3 <= 3;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = 5 > 3;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = 3 >= 3;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = 5 >= 3;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'var x = 5 != 3'.
	self assert: (interpreter environment at: 'x') equals: true.
]

{ #category : #tests }
JbInterpreterTest >> testAssignmentStatementCall [
	self interpret: 'x = 33;'.
	self assert: (interpreter environment at: 'x') equals: 33.
	self interpret: 'x = true;'.
	self assert: (interpreter environment at: 'x') equals: true.
	self interpret: 'x = false;'.
	self assert: (interpreter environment at: 'x') equals: false.
]

{ #category : #tests }
JbInterpreterTest >> testConcatBinding [

	self interpret: 'var x = concat("a","b");'.
	self assert: (interpreter environment at: 'x') equals: 'ab'.	
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
	
	self interpret: 'var x = function(a, b) { return a + b; }; var y = x(1, 2);'.
	self assert: (interpreter environment at: 'y') equals: 3.
	
	self interpret: 'var x = function(a, b, c) { return a + b + c; }; var y = x(1, 2, 3);'.
	self assert: (interpreter environment at: 'y') equals: 6.
	
	
]

{ #category : #tests }
JbInterpreterTest >> testFunctionDefinition [
	
	self interpret: 'var x = function(a, b, c) {};'.
	self assert: ((interpreter environment at: 'x') isKindOf: JbFunction).
	self assert: (interpreter environment at: 'x') parameters size equals: 3.
	self assert: (interpreter environment at: 'x') body size equals: 0.
	self assert: (interpreter environment at: 'x') environment equals: interpreter environment.
	
	self interpret: 'var x = function(a, b, c) { a = 0; };'.
	self assert: (interpreter environment at: 'x') parameters size equals: 3.
	self assert: (interpreter environment at: 'x') body size equals: 1.
	self assert: (interpreter environment at: 'x') environment equals: interpreter environment.
]

{ #category : #tests }
JbInterpreterTest >> testIfElseStatementCall [

	self interpret: 'var x = 1; if (x == 1) { var r = 10; return r; } else { var r = 20; return r; };'.
	self assert: (interpreter environment at: 'r') equals: 10.
	
	self interpret: 'var x = 2; if (x == 1) { var r = 10; return r; } else { var r = 20; return r; };'.
	self assert: (interpreter environment at: 'r') equals: 20.
]

{ #category : #tests }
JbInterpreterTest >> testIfStatementCall [

	self interpret: 'var x = 1; if (x == 1) { var r = 10; return r; };'.
	self assert: (interpreter environment at: 'r') equals: 10.
	
	self interpret: 'var x = 2; var y = false; if (x == 1) { var y = true; return y; };'.
	self assert: (interpreter environment at: 'y') equals: false.
	
	
]

{ #category : #tests }
JbInterpreterTest >> testLengthBinding [

	self interpret: 'var x = length("hello");'.
	self assert: (interpreter environment at: 'x') equals: 5.
	
	self interpret: 'var x = length("a");'.
	self assert: (interpreter environment at: 'x') equals: 1.
]

{ #category : #tests }
JbInterpreterTest >> testModBinding [

	self interpret: 'var x = mod(4, 2);'.
	self assert: (interpreter environment at: 'x') equals: 0.
]

{ #category : #tests }
JbInterpreterTest >> testNotBinding [

	self interpret: 'var x = not(false);'.
	self assert: (interpreter environment at: 'x') equals: true.
]

{ #category : #tests }
JbInterpreterTest >> testPrintBinding [
	| mtTest |
	mtTest := MockTranscript new.
	interpreter transcript: mtTest.
	self interpret: 'var p1 = print(5);'.
	self assert: mtTest contents equals: '5'.
	
	self interpret: 'var p2 = print(6);'.
	self assert: mtTest contents equals: '56'.
]

{ #category : #tests }
JbInterpreterTest >> testPrintlnBinding [
	| mtTest |
	mtTest := MockTranscript new.
	interpreter transcript: mtTest.
	self interpret: 'var p1 = println(5);'.
	self assert: mtTest contents equals: '5', String cr.
	
	self interpret: 'var p2 = println(6);'.
	self assert: mtTest contents equals: '5', String cr, '6', String cr.
]

{ #category : #tests }
JbInterpreterTest >> testWhileLoopStatementCall [

	self interpret: 'var x = 1; var y = 0; while (x <= 10) { y = y + x; x = x + 1; }'.
	self assert: (interpreter environment at: 'y') equals: 55.
	
]
