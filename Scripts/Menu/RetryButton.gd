extends TextureButton

func _on_RetryButton_pressed():
	MusicController.playSoundeffect("hit");
	LevelState.setPlayState(LevelState.playstate.retry);
