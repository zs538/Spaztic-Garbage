extends Node3D

var patternSelected = false
var currentPattern = []
var index = 0

var patterns = [
		[
			[2,0.5],
			[1,0.5],
			[0,-0.5],
			[2,0]
		]
	]

func returnPattern():
	return patterns.pick_random()

func mirrorPattern(patternToMirror):
	var patternMirrored = []
	for enemyData in patternToMirror:
		var typeToAppend = enemyData[0]
		var positionToAppend = 0
		match enemyData[1]:
			0.5: positionToAppend = -0.5
			-0.5: positionToAppend = 0.5
		patternMirrored.append([typeToAppend,positionToAppend])
	return patternMirrored

func selectPattern():
	index = 0
	var rnd = [false, true]
	if rnd.pick_random():
		currentPattern = returnPattern()
	else:
		currentPattern = mirrorPattern(returnPattern())
	patternSelected = true

func getCurrentEnemy():
	return currentPattern[index]

func nextEnemy():
	if index < currentPattern.size() - 1:
		index += 1
	else:
		patternSelected = false
