extends TextureButton

func _on_PlayButton_pressed():
	SceneChanger.changeScene("Scenes/MainLevelScene.tscn");

func _on_AboutButton_pressed():
	SceneChanger.changeScene("Scenes/About.tscn");
