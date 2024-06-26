Class {
	#name : #NeuronTest,
	#superclass : #TestCase,
	#category : #NeuralNetwork
}

{ #category : #tests }
NeuronTest >> testTrainingAND [
	| p |
	"This is using sigmoid AF by default"
	p := Neuron new.
	p weights: { -1 . -1 }.
	p bias: 2.
	
	5000 timesRepeat: [ 
		p train: #(0 0) desiredOutput: 0.
		p train: #(0 1) desiredOutput: 0.
		p train: #(1 0) desiredOutput: 0.
		p train: #(1 1) desiredOutput: 1.
	].

	self assert: ((p feed: #(0 0)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(0 1)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(1 0)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(1 1)) closeTo: 1 precision: 0.1).
]

{ #category : #tests }
NeuronTest >> testTrainingOR [
	| p |
	"This is using sigmoid AF by default"
	p := Neuron new.
	p weights: { -1 . -1 }.
	p bias: 2.
	
	5000 timesRepeat: [ 
		p train: #(0 0) desiredOutput: 0.
		p train: #(0 1) desiredOutput: 1.
		p train: #(1 0) desiredOutput: 1.
		p train: #(1 1) desiredOutput: 1.
	].

	self assert: ((p feed: #(0 0)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(0 1)) closeTo: 1 precision: 0.1).
	self assert: ((p feed: #(1 0)) closeTo: 1 precision: 0.1).
	self assert: ((p feed: #(1 1)) closeTo: 1 precision: 0.1).
]

{ #category : #tests }
NeuronTest >> testTrainingXOR [
	| p |
	"This is using sigmoid AF by default"
	"Apparently XOR cannot be trained by sigmoid function either"
	p := Neuron new.
	p weights: { -1 . -1 }.
	p bias: 2.
	
	5000000 timesRepeat: [ 
		p train: #(0 0) desiredOutput: 0.
		p train: #(0 1) desiredOutput: 1.
		p train: #(1 0) desiredOutput: 1.
		p train: #(1 1) desiredOutput: 0.
	].

	self assert: ((p feed: #(0 0)) closeTo: 0 precision: 0.1).
	self assert: ((p feed: #(0 1)) closeTo: 1 precision: 0.1).
	self assert: ((p feed: #(1 0)) closeTo: 1 precision: 0.1).
	self assert: ((p feed: #(1 1)) closeTo: 0 precision: 0.1).
]
