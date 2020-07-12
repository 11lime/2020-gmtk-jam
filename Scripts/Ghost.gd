extends KinematicBody2D

export var possessed = false
export var speed : int 
export var JumpForce : int 
export var gravity : int 

#const isTarget : bool = false;

var vel : Vector2 = Vector2()
var timeInGhost : float

onready var sprite = $Sprite

func possess():
	print("ghost possess");
	possessed = true
	vel.y = 0;
	timeInGhost = 0;
	MusicController.playSoundeffect("eject");
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
	if LevelState.isPlaying():
		if possessed: 
			vel.x = 0
			vel.y += delta * gravity
		
			handleInput();
		
			vel.x *= delta;
			
			if vel.x > 0:
				sprite.frame = 1
				sprite.flip_h = false
			elif vel.x < 0:
				sprite.frame = 1
				sprite.flip_h = true
			else:
				sprite.frame = 0
			
			vel = move_and_slide(vel,Vector2.UP)
			
			timeInGhost += delta;
			if (timeInGhost > 3):
				LevelState.setPlayState(LevelState.playstate.gameover);
				print("you lose");
		
