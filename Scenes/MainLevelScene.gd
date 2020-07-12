extends Node2D

onready var PauseMenu = $CanvasLayer/PauseMenu;
onready var GameOverMenu = $CanvasLayer/GameOverMenu;

func _ready():
	resetLevel();

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_ESCAPE) and just_pressed:
		switchGameState();

func switchGameState():
	if (LevelState.currentState == LevelState.playstate.paused):
		unpauseGame();
	elif (LevelState.currentState == LevelState.playstate.playing):
		pauseGame();
	else:
		resetLevel();
		
func pauseGame():
	PauseMenu.visible = true;
	LevelState.setPlayState(LevelState.playstate.paused);
	
func unpauseGame():
	PauseMenu.visible = false;
	LevelState.setPlayState(LevelState.playstate.playing);
			
func resetLevel():
	PauseMenu.visible = false;
	GameOverMenu.visible = false;
	LevelState.setPlayState(LevelState.playstate.playing);
	# LevelState.setPlayState(LevelState.playstate.playing);
	print("Tried to reset level but not implemented yet");
