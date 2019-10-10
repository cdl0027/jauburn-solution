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
			return gcd(b, mod(a,b));
		} };
		var x=str(input("Enter first natural number: "));
		var y=str(input("Enter second natural number: "));
		var p = println(gcd(x,y));'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> newton [
	^'var x=str(input("Please enter square:"));
	  var xn=x/2;
	  var i=1;
	  while(i<=100) { 
		var x2=xn*xn;
		xn1=x2-x;
		xn2=2*xn;
		xn3=xn1/xn2;
		xn=xn-xn3;
		var p=println(xn);
		i=i+1;
	  }
	  var p1=println(xn);'
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
