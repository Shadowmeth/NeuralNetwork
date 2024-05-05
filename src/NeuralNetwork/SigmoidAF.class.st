Class {
	#name : #SigmoidAF,
	#superclass : #ActivationFunction,
	#category : #NeuralNetwork
}

{ #category : #'accessing - delegated' }
SigmoidAF >> derivative: output [
	^ output * (1 - output)
]

{ #category : #'accessing - delegated' }
SigmoidAF >> eval: z [
	^ 1 / (1 + z negated exp)
]
