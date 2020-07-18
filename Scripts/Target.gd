extends KinematicBody2D

onready var sprite : AnimatedSprite = $Sprite

export var acceleration = 512
export var max_speed = 64
export var friction = .02
export var ground_friction = .1
export var gravity = 400
export var extraGravity = 200
export var jump_power = -225

const isTarget : bool = true;

var velocity : Vector2 = Vector2()
var possessed : bool
var moved : bool

func possess():
	possessed = true

func unpossess():
	possessed = false
	
func handle_input(delta):
	var input = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	if input != 0:
		velocity.x += clamp(input * acceleration * delta, -max_speed, max_speed)
		moved = true
	if Input.is_action_just_pressed("ui_up") and (is_on_floor() or is_on_wall()):
		velocity.y = jump_power
		return true
	return false

func _physics_process(delta):
	if LevelState.isPlaying():
		handlePhysics(delta);
	
func handlePhysics(delta):
	var jumped = false
	moved = false;
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
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	velocity = move_and_slide(velocity, Vector2.UP)
	
