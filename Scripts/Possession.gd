extends Node2D

onready var ghost = $Ghost
onready var child = ghost
#onready var cameraNode = $CameraNode

onready var radius = $Ghost/Radius

onready var max_dist = $Ghost/Radius/CollisionShape2D.shape.radius

var possessed = false
var connected = []
var currentPossession;
var lastPossession;

func _ready():
	child.possess()
	currentPossession = ghost;

func _process(delta):
	if not connected.empty() and not possessed:
		var closest
		var dist = max_dist
		for body in connected:
			if body != lastPossession:
				var distance = body.global_position.distance_to(ghost.global_position)
				if distance < dist: closest = body
		if closest:
			ghost.unpossess()
			closest.possess()
			currentPossession = closest;
			possessed = true
			
	if possessed:
		transform = currentPossession.transform;

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_SPACE) and just_pressed:
		if (possessed):
			print("- unpossessing -");
			currentPossession.unpossess();
			ghost.global_position = currentPossession.global_position;
			ghost.possess();
			possessed = false;
			lastPossession = currentPossession;
			currentPossession = ghost;

func validPossessionTarget(body) -> bool:
	return body.has_method("possess") and body != ghost;

func _on_Radius_body_entered(body):
	if validPossessionTarget(body):
		if not body in connected: connected.append(body)

func _on_Radius_body_exited(body):
	if body in connected:
		connected.remove(connected.find(body))
