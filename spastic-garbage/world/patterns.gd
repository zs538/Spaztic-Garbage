extends Node3D

var patternSelected = false
var currentPattern = []
var index = 0

var patterns = [
		[
			[0,0],
			[0,0.5],
			[0,-0.5]
		],
		[
			[0,0.5],
			[0,0.5],
			[0,-0.5]
		]
	]

func returnPattern():
	return patterns.pick_random()

func selectPattern():
	index = 0
	currentPattern = returnPattern()
	patternSelected = true

func getCurrentEnemy():
	return currentPattern[index]

func nextEnemy():
	if index < currentPattern.size() - 1:
		index += 1
	else:
		patternSelected = false
