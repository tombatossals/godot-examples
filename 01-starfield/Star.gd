extends Node2D

var font
var F = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var color

func _ready():
	font = load("res://assets/SunMoonStars.tres")

func array_rand(array):
	randomize()
	color = Color(randf(), randf(), randf())
	var shuffledList = []
	var index = range(array.size())
	for i in range(array.size()):
		var x = randi()%index.size()
		shuffledList.append(array[index[x]])
		index.remove(x)
	array = shuffledList
	return array[1]

func _draw():
	draw_string(font, Vector2(100, 100), array_rand(F), color)