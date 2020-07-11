extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var possessed = false
export var speed : int 
export var JumpForce : int 
export var gravity : int 

var vel : Vector2 = Vector2()
onready var sprite : Sprite = $Sprite

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
func _physics_process(delta):
	if possessed: 
		vel.x = 0
		vel.y += gravity
		if Input.is_action_pressed("ui_left"):
			vel.x -= speed
		if Input.is_action_pressed("ui_right"):
			vel.x += speed
		vel = move_and_slide(vel,Vector2.UP)
	else:
		print("Doing my thing")
