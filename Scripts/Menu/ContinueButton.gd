extends TextureButton

func _on_ContinueButton_pressed():
	LevelState.setPlayState(LevelState.playstate.playing);
