extends KinematicBody2D

signal my_signal(target, collision, tileNumber);

onready var sprite : Sprite = $Sprite

export var speed : int 
export var JumpForce : int 
export var gravity : int 
export var tileNumber : int

var vel : Vector2 = Vector2()
var possessed : bool
var jumping : bool

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
	
func handle_input(delta):
	if possessed:
		if Input.is_key_pressed(KEY_A):
			jumping = true;
		else: 
			jumping = false;
		if Input.is_action_pressed("ui_left"):
			vel.x -= speed
		if Input.is_action_pressed("ui_right"):
			vel.x += speed

func _physics_process(delta):
	vel.x = 0;
	
	handle_input(delta);
	
	if (is_on_floor()):
		if (jumping):
			vel.y = -JumpForce;
		else:
			vel.y = 0;
	else:
		vel.y += delta * gravity;
	
	vel.x *= delta;
	vel = move_and_slide(vel, Vector2.UP)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i);
		if collision && collision.collider is TileMap && possessed:
			emit_signal("my_signal", self, collision, tileNumber);
