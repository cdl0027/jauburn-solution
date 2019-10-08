Class {
	#name : #MockTranscript,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
MockTranscript >> contents [
	^ contents
]

{ #category : #accessing }
MockTranscript >> contents: anObject [
	contents := anObject
]
