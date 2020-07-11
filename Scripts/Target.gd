extends KinematicBody2D

onready var sprite : Sprite = $Sprite

export var speed : int 
export var JumpForce : int 
export var gravity : int 

var vel : Vector2 = Vector2()
var possessed : bool

func possess():
	print(get_name() + " - target possess");
	rotation += PI;
	possessed = true

func unpossess():
	print(get_name() + " - target unpossess");
	rotation -= PI;
	possessed = false


func _ready():
	print("target is ready");

func _physics_process(delta):
	vel.x = 0
	vel.y = gravity;
	if possessed: 
		if Input.is_action_pressed("ui_left"):
			vel.x -= speed
		if Input.is_action_pressed("ui_right"):
			vel.x += speed

	vel = move_and_slide(vel * delta,Vector2.UP)
