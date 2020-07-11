extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter : int = 0
var possessed : int = 1
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
	vel.x = 0
	vel.y = gravity
	if possessed == 1: 
		print(possessed)
		print(counter)
		if Input.is_action_pressed("ui_left"):
			vel.x -= speed
		if Input.is_action_pressed("ui_right"):
			vel.x += speed
		if Input.is_action_pressed("ui_accept"):  ### this is a mess
			if possessed == 1:
				possessed = 2  ### mess ends
	elif possessed == 2: 
		 ### also mess
		if possessed == 2:
			possessed = 1  ### mess ends
		print(possessed)
		print(counter)
	vel = move_and_slide(vel,Vector2.UP)
	counter += 1
