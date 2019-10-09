Class {
	#name : #MockTranscript,
	#superclass : #Object,
	#instVars : [
		'contentStream'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
MockTranscript >> contents [ 
	^contentStream contents
]

{ #category : #'stop conditions' }
MockTranscript >> cr [
	contentStream cr.
]

{ #category : #initialization }
MockTranscript >> initialize [ 
	super initialize.
	contentStream := WriteStream on: String new.
]

{ #category : #streaming }
MockTranscript >> show: aString [
	contentStream nextPutAll: aString.
]
