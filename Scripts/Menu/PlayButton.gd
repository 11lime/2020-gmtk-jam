extends TextureButton

func _on_PlayButton_pressed():
	SceneChanger.changeScene("Scenes/Level.tscn");

func _on_AboutButton_pressed():
	SceneChanger.changeScene("Scenes/About.tscn");
