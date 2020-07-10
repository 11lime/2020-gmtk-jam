extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Array, NodePath) var children = []

onready var child = $Ghost


# Called when the node enters the scene tree for the first time.
func _ready():
	print(children)
	child.possess()

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE): child.unpossess()
