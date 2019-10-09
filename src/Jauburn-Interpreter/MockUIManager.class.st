Class {
	#name : #MockUIManager,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
MockUIManager >> contents [
	^ contents
]

{ #category : #accessing }
MockUIManager >> request: aString [
	contents := aString
]
