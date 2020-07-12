extends TextureButton

func _on_PlayButton_pressed():
	MusicController.playSoundeffect("hit");
	SceneChanger.changeScene("Scenes/MainLevelScene.tscn");

func _on_AboutButton_pressed():
	MusicController.playSoundeffect("hit");
	SceneChanger.changeScene("Scenes/About.tscn");
