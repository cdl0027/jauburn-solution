"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> gcdProgram [
	^'var gcd=function(a,b) { 
		if (b==0) {
			var p = println("1if"); 
			return a; 
		} else {
			var p1 = println("2if");
			var m = mod(a,b);
			return gcd(b, m); 
		} }; 
		var y=gcd(1071, 462);'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	^'var x = 1;
		var y = 10 * x - 1;
		if (y == 9) { 
   			x = 16;
			return x;
		};'


]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]
