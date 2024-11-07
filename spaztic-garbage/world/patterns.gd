extends Node3D

var patternSelected = false
var currentPattern = []
var index = 0

const SPACE = 0
const FIRE = 1
const SOY = 2
const MLP = 3
const MRP = 4
const BURT = 5
const BULLET = 6
const FATASS = 7
const SPROKE = 8
const MEDS = 9

const R = 0.5
const L = -0.5
const M = 0


var patterns = [
		[
			[SOY, L],
			[BURT, M],
			[SPACE, M],
			[FIRE, M],
			[SPROKE, R],
			[MLP, R],
			[FIRE, R]
		],
		[
			[BURT, L],
			[FIRE, R],
			[MRP, L],
			[SOY, R],
			[FIRE, R],
			[BURT, M],
			[FIRE, M]
		],
		[
			[MLP, M],
			[FIRE, R],
			[SOY, M],
			[FIRE, L],
			[MEDS, R],
			[BURT, M],
			[FIRE, R],
			[SOY, R],
			[SPACE, M]
		],
		[
			[MRP, L],
			[FIRE, R],
			[SOY, M],
			[FIRE, L],
			[SPACE, M],
			[SOY, M],
			[FIRE, R],
			[BURT, R],
		],
		[
			[SOY, L],
			[BURT, M],
			[SPACE, M],
			[FIRE, M],
			[SPROKE, R],
			[MLP, R],
			[SOY, R],
			[SPACE, M],
			[BURT, M],
			[FIRE, M]
		],
		[
			[BURT, L],
			[FIRE, R],
			[MRP, L],
			[SPROKE, M],
			[FIRE, M],
			[BURT, R],
			[SOY, R],
			[FIRE, R]
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
