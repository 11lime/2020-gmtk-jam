extends TextureButton

func _on_RetryButton_pressed():
	LevelState.setPlayState(LevelState.playstate.retry);
