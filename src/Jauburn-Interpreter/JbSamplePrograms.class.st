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
			return a; 
		} else { 
			gcd(b, mod(a,b));
		} };'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> newton [
	^'var x=input("Please enter square:");
	  var xn=x/2;
	  var i=1;
	  while(i<=10) { 
		var x2=xn*xn;
		xn1=x2-x;
		xn2=2*xn;
		xn3=xn1/xn2;
		xn=xn-xn3;
		i=i+1;
	  }
	  return xn;'
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
