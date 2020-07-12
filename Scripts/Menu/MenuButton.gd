extends TextureButton

func _on_MenuButton_pressed():
	MusicController.playSoundeffect("hit");
	SceneChanger.changeScene("Scenes/Menu.tscn");
