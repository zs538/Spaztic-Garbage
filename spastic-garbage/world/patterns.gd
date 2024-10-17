extends Node3D

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
