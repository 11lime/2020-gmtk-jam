extends Node

signal stateChanged(newState);

enum playstate {
	playing,
	paused,
	gameover,
	retry,
	nextlevel
} 

var currentLevel : String;
var currentState = playstate.playing;

func setCurrentLevel(levelName : String):
	currentLevel = levelName;

func getCurrentLevel() -> String:
	return "res://Scenes/Levels/" + currentLevel + ".tscn"

func isPlaying() -> bool:
	return currentState == playstate.playing;

func setPlayState(newState):
	if (newState != currentState):
		currentState = newState;
		emit_signal("stateChanged", newState);
