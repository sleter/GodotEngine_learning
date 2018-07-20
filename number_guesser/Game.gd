extends Node


onready var message = $Message
onready var button_right = $Right

# between 0 - 1000
var guess
var min_guessed = 0
var max_guessed = 1000
var ended = false

func _ready():
	guess = (min_guessed + max_guessed)/2
	print("--------------------")
	print("Welcome in number guesser")
	message.text = "Is "+str(guess)+" your number?"
	
func _process(delta):
	if Input.is_action_just_pressed("up"):
		_try_guess("up")
	elif Input.is_action_just_pressed("down"):
		_try_guess("down")
	elif Input.is_action_just_pressed("space"):
		if(ended):
			_restart_game()
		else:
			_end_game()

#type up - greater or down - lesser
func _try_guess(type):
	if type == "up":
		min_guessed = guess
	else:
		max_guessed = guess
	guess = (min_guessed+max_guessed)/2
	message.text = "Is "+str(guess)+" your number?"
	
func _end_game():
	ended = true
	print("Your number was: "+str(guess)+"!")
	message.text = "Your number was: "+str(guess)+"!"
	button_right.text = "RESTART"
	
func _restart_game():
	get_tree().reload_current_scene()

func _on_Up_pressed():
	_try_guess("up")

func _on_Down_pressed():
	_try_guess("down")

func _on_Right_pressed():
	if(ended):
		_restart_game()
	else:
		_end_game()
