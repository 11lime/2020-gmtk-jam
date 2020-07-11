extends KinematicBody2D

export var possessed = false
export var speed : int 
export var JumpForce : int 
export var gravity : int 

var vel : Vector2 = Vector2()
var timeInGhost : float

func possess():
	print("ghost possess");
	possessed = true
	vel.y = 0;
	timeInGhost = 0;
	show()

func unpossess():
	print("ghost unpossess");
	possessed = false
	hide()

func _ready():
	hide();
	
func handleInput():
		if Input.is_action_pressed("ui_left"):
			vel.x -= speed
		if Input.is_action_pressed("ui_right"):
			vel.x += speed

func _physics_process(delta):
	if possessed: 
		vel.x = 0
		vel.y += delta * gravity
	
		handleInput();
	
		vel.x *= delta;
		
		vel = move_and_slide(vel,Vector2.UP)
		
		timeInGhost += delta;
		if (timeInGhost > 3):
			print("you lose");
		
