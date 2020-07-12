extends Node

signal stateChanged(newState);

enum playstate {
	playing,
	paused,
	gameover,
	retry,
	nextlevel
} 

var currentLevel : String = "res://Scenes/Levels/Level.tscn";
var currentState = playstate.playing;

func isPlaying() -> bool:
	return currentState == playstate.playing;

func setPlayState(newState):
	if (newState != currentState):
		print("new State is " + str(newState));
		currentState = newState;
		emit_signal("stateChanged", newState);
