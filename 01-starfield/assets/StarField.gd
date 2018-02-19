extends Node2D

var starfield = []
export var num_stars = 300
export var speed = 2.0
var spread = 256

var starNode = load("res://Star.tscn")
var stars = []

func SetPos(drawsize):
	randomize()
	return Vector3(rand_range(-drawsize.x, drawsize.x), rand_range(-drawsize.y, drawsize.y), rand_range(200, 255))

func _ready():
	var drawsize = OS.get_window_size()
	for n in range(num_stars):
		starfield.append(SetPos(drawsize))
		stars.append(starNode.instance())
		add_child(stars[n])
	
	
func DrawStar(n, drawsize):

	if starfield[n].z < speed:
		starfield[n] = SetPos(drawsize)
		
	starfield[n].z -= speed
	var sx = (starfield[n].x*spread)/(starfield[n].z)+drawsize.x/2
	var sy = (starfield[n].y*spread)/(starfield[n].z)+drawsize.y/2
	
	if sx < 0 or sx > drawsize.x:
		starfield[n] = SetPos(drawsize)
	
	if sy < 0 or sy > drawsize.y:
		starfield[n] = SetPos(drawsize)
	
	var size = Vector2(1-starfield[n].z*0.004, 1-starfield[n].z*0.004)
	stars[n].set_position(Vector2(sx, sy))
	stars[n].set_scale(Vector2(size.x, size.y))

func _process(delta):
	var drawsize = OS.get_window_size()
	
	if Input.is_action_pressed("key_exit"):
		get_tree().quit()

	for n in range(num_stars):
		DrawStar(n, drawsize)
		update()