extends Node3D

var patternSelected = false
var currentPattern = []
var index = 0

var patterns = [
		[
			[1,0],
			[0,0.5],
			[0,-0.5]
		]
	]

func returnPattern():
	return patterns.pick_random()

func flipPattern(patternToFlip):
	var flippedPattern = []
	for enemyData in patternToFlip:
		var typeToAppend = enemyData[1]
		var positionToAppend = 0
		match enemyData[1]:
			0.5: pass

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
