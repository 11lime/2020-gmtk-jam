extends Node

enum playstate {
	playing,
	paused,
	gameover
} 

var currentState = playstate.playing;

func isPlaying() -> bool:
	return currentState == playstate.playing;

func setPlayState(newState):
	print("new State is " + str(newState));
	currentState = newState;
