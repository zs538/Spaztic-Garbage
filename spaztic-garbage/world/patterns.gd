extends Node3D

var patternSelected = false
var currentPattern = []
var index = 0

const SPACE = 0
const HEXSAW = 1
const TARD = 2
const MEWTARDL = 3
const MEWTARDR = 4
const XIOTER = 5
const BULLET = 6
const FATASS = 7

const R = 0.5
const L = -0.5
const M = 0


var patterns = [
		[
			[TARD,M],
			[XIOTER,R],
			[HEXSAW, M],
			[SPACE, M],
			[MEWTARDR, L]
		]
	]

func returnPattern():
	return patterns.pick_random()

func mirrorPattern(patternToMirror):
	var patternMirrored = []
	for enemyData in patternToMirror:
		var typeToAppend = enemyData[0]
		match typeToAppend:
			3: typeToAppend = 4
			4: typeToAppend = 3
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
