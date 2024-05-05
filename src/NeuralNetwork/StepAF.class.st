Class {
	#name : #StepAF,
	#superclass : #ActivationFunction,
	#category : #NeuralNetwork
}

{ #category : #'accessing - delegated' }
StepAF >> derivative: output [
	^ 1
]

{ #category : #'accessing - delegated' }
StepAF >> eval: z [
	^ (z > 0) ifTrue: [ 1 ] ifFalse: [ 0 ]
]
