Class {
	#name : #Neuron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias',
		'learningRate',
		'activationFunction'
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
	^ activationFunction eval: z
]

{ #category : #accessing }
Neuron >> initialize [
	super initialize.
	learningRate := 0.1
]

{ #category : #accessing }
Neuron >> learningRate [
	"Return the learning rate of the neuron."
	^ learningRate
]

{ #category : #accessing }
Neuron >> learningRate: aLearningRateAsFloat [
	"Set the learning rate of the neuron. The argument should be a small floating value. For example, 0.01"
	learningRate := aLearningRateAsFloat
]

{ #category : #'as yet unclassified' }
Neuron >> train: inputs desiredOutput: desiredOutput [
	| diff output delta |
	
	output := self feed: inputs.
	diff := desiredOutput - output.
	delta := diff * (activationFunction  derivative: output).
	
	inputs withIndexDo: [ :anInput :index | 
		weights at: index put: ((weights at: index) + (learningRate * delta * anInput))
	].
	
	bias := bias + (learningRate * delta).
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
