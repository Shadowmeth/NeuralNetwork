Class {
	#name : #ActivationFunction,
	#superclass : #Object,
	#category : #NeuralNetwork
}

{ #category : #'accessing - delegated' }
ActivationFunction >> derivative: output [
	^ self subclassResponsibility
]

{ #category : #'accessing - delegated' }
ActivationFunction >> eval: z [
	^ self subclassResponsibility
]
