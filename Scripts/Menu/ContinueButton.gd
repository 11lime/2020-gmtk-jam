extends TextureButton

func _on_ContinueButton_pressed():
	MusicController.playSoundeffect("hit");
	LevelState.setPlayState(LevelState.playstate.playing);
