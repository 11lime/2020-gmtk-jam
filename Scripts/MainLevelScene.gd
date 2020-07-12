extends Node2D

onready var PauseMenu = $CanvasLayer/PauseMenu;
onready var GameOverMenu = $CanvasLayer/GameOverMenu;

func _ready():
	LevelState.connect("stateChanged", self, "onStateChange");
	resetLevel();

func onStateChange(newState):
	print("we got it: " + str(newState));
	if (newState == LevelState.playstate.gameover):
		gameOver();
	if (newState == LevelState.playstate.retry):
		retry();
	if (newState == LevelState.playstate.playing):
		hideMenus();
	if (newState == LevelState.playstate.paused):
		pauseGame();

func hideMenus():
	GameOverMenu.visible = false;
	PauseMenu.visible = false;

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_ESCAPE) and just_pressed:
		switchGameState();

func switchGameState():
	if (LevelState.currentState == LevelState.playstate.paused):
		LevelState.setPlayState(LevelState.playstate.playing);
	elif (LevelState.currentState == LevelState.playstate.playing):
		LevelState.setPlayState(LevelState.playstate.paused);
	else:
		resetLevel();
		
func gameOver():
	print("gameover menu ");
	GameOverMenu.visible = true;
	
func retry():
	print("retry ");
	resetLevel();
		
func pauseGame():
	PauseMenu.visible = true;
			
func resetLevel():
	LevelState.setPlayState(LevelState.playstate.playing);
	print("Tried to reset level but not implemented yet");
