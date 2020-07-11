extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var possessed = false

func possess():
	possessed = true
	show()

func unpossess():
	possessed = false
	hide()


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if possessed: 
		pass
