Class {
	#name : #Neuron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias',
		'learningRate'
	],
	#category : #NeuralNetwork
}

{ #category : #accessing }
Neuron >> bias [
	"Return the bias of the neuron."
	^ bias
]

{ #category : #accessing }
Neuron >> bias: aNumber [
	"Set the bias of the neuron."
	bias := aNumber
]

{ #category : #accessing }
Neuron >> feed: inputs [
	| z |
	z := (inputs with: weights collect: [ :x :w | x * w]) sum + bias.
	^ z > 0 ifTrue: [ 1 ] ifFalse: [ 0 ].
]

{ #category : #accessing }
Neuron >> learningRate [
	"Return the learning rate of the neuron."
	^ learningRate
]

{ #category : #accessing }
Neuron >> learningRate: aNumber [
	"Set the learning rate of the neuron."
	learningRate := aNumber
]

{ #category : #'as yet unclassified' }
Neuron >> train: inputs desiredOutput: desiredOutput [
	| theError output newWeight |
	output := self feed: inputs.
	theError := desiredOutput - output.
	inputs 
		withIndexDo: [ :anInput :index | 
			newWeight := (weights at: index) + (learningRate * anInput * theError).
			weights at: index put: newWeight ].
	bias := bias + (learningRate * theError).
]

{ #category : #accessing }
Neuron >> weights [
	"Return the weights of the neuron."
	^ weights
]

{ #category : #accessing }
Neuron >> weights: someWeightsAsNumbers [
	"Set the weights of the neuron.
	Takes a collection of numbers as argument."
	weights := someWeightsAsNumbers
]
