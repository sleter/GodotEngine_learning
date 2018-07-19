extends Node

# between 0 - 1000
var guess
var min_guessed = 0
var max_guessed = 1000

func _ready():
	print("--------------------")
	print("Welcome in number guesser")
	
func _process(delta):
	if Input.is_action_just_pressed("up"):
		print("up pressed")
	elif Input.is_action_just_pressed("down"):
		print("down pressed")

