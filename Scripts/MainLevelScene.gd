extends Node2D

onready var PauseMenu = $CanvasLayer/PauseMenu;
onready var GameOverMenu = $CanvasLayer/GameOverMenu;
onready var LevelNode = $LevelNode

var currentLevel;

func _ready():
	MusicController.startPlaying("res://Music/Ghostie_ingame_OGG.ogg");
	LevelState.setCurrentLevel("Level_1");
	setLevel();
	LevelState.connect("stateChanged", self, "onStateChange");
	
func setLevel():
	call_deferred("_deferredSetLevel");

func _deferredSetLevel():
	var levelPath = LevelState.getCurrentLevel();
	
	var newLevelScene = load(levelPath);
	if (currentLevel != null):
		LevelNode.remove_child(currentLevel)
	
	currentLevel = newLevelScene.instance();
	LevelNode.add_child(currentLevel);
	
	LevelState.setPlayState(LevelState.playstate.playing);	

func onStateChange(newState):
	if (newState == LevelState.playstate.gameover):
		gameOver();
	if (newState == LevelState.playstate.retry):
		retry();
	if (newState == LevelState.playstate.playing):
		hideMenus();
	if (newState == LevelState.playstate.paused):
		pauseGame();
	if (newState == LevelState.playstate.nextlevel):
		setLevel();

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
		setLevel();
		
func gameOver():
	GameOverMenu.visible = true;
	
func retry():
	setLevel();
		
func pauseGame():
	PauseMenu.visible = true;
