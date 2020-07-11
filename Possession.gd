extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var possessed = false

onready var ghost = $Ghost
onready var child = ghost

onready var radius = $Ghost/Radius

onready var max_dist = $Ghost/Radius/CollisionShape2D.shape.radius

var connected = []


# Called when the node enters the scene tree for the first time.
func _ready():
	child.possess()

func _process(delta):
	if not connected.empty() and not possessed:
		var closest
		var dist = max_dist
		for body in connected:
			if body.has_method("possess") and body != ghost:
				var distance = body.global_position.distance_to(ghost.global_position)
				if distance < dist: closest = body
		if closest:
			ghost.unpossess()
			closest.possess()
			possessed = true
		
	if Input.is_key_pressed(KEY_SPACE): child.unpossess()


func _on_Radius_body_entered(body):
	if not body in connected: connected.append(body)


func _on_Radius_body_exited(body):
	connected.remove(connected.find(body))
