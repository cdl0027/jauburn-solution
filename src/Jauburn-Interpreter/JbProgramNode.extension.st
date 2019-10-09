Extension { #name : #JbProgramNode }

{ #category : #'*Jauburn-Interpreter' }
JbProgramNode >> executeIn: environment [
"	Transcript show: '-------- JbProgramNode>>executeIn: --------'; cr.
	Transcript show: environment printString; cr.
	statements do: [ :s | Transcript show: s printString; cr. ]."

	statements do: [ :each | each executeIn: environment ]
]
