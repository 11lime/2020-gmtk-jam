extends KinematicBody2D

export var possessed = false
export var speed : int 
export var JumpForce : int 
export var gravity : int 

var vel : Vector2 = Vector2()

func possess():
	print("ghost possess");
	possessed = true
	show()

func unpossess():
	print("ghost unpossess");
	possessed = false
	hide()

func _ready():
	hide()

func _physics_process(delta):
	vel.x = 0
	vel.y = gravity
	if possessed: 
		if Input.is_action_pressed("ui_left"):
			vel.x -= speed
		if Input.is_action_pressed("ui_right"):
			vel.x += speed
			
	vel = move_and_slide(vel * delta,Vector2.UP)
