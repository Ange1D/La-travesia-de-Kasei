extends Node

onready var lives : int = 3
onready var level : int
onready var object : bool
onready var rng : RandomNumberGenerator = RandomNumberGenerator.new()


func random(min_number, max_number):
	rng.randomize()
	var random = rng.randf_range(min_number, max_number)
	return random
