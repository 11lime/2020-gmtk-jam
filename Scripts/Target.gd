extends KinematicBody2D

signal my_signal(target, collision, tileNumber);

onready var sprite : Sprite = $Sprite

export var acceleration = 512
export var max_speed = 64
export var friction = .02
export var ground_friction = .1
export var gravity = 400
export var extraGravity = 200
export var jump_power = -225

var velocity : Vector2 = Vector2()
var possessed : bool
var moved : bool

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
	moved = false
	var input = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	if input != 0:
		velocity.x += clamp(input * acceleration * delta, -max_speed, max_speed)
		moved = true
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or is_on_wall()):
		velocity.y = jump_power
		return true
	return false

func _physics_process(delta):
	var jumped = false
	if possessed: jumped = handle_input(delta);
	if not jumped:
		if velocity.y > 0:
			velocity.y += (gravity + extraGravity) * delta
		else:
			velocity.y += gravity * delta
	if not moved:
		if is_on_floor():
			velocity.x = lerp(velocity.x, 0, ground_friction)
		else:
			velocity.x = lerp(velocity.x, 0, friction)
	velocity = move_and_slide(velocity, Vector2.UP)
	
#	for i in get_slide_count():
#		var collision = get_slide_collision(i);
#		if collision && collision.collider is TileMap && possessed:
#			emit_signal("my_signal", self, collision, tileNumber);
