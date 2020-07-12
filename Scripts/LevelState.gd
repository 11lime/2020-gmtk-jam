extends Node

signal stateChanged(newState);

enum playstate {
	playing,
	paused,
	gameover,
	retry
} 

var currentState = playstate.playing;

func isPlaying() -> bool:
	return currentState == playstate.playing;

func setPlayState(newState):
	print("new State is " + str(newState));
	currentState = newState;
	emit_signal("stateChanged", newState);
