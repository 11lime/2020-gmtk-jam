extends Node2D

export var nextLevel : String

func _on_Area2D_body_entered(body):
	if (body.get("isTarget") != null):
		gotoNextLevel();

func gotoNextLevel():
	if (nextLevel == ""):
		# Victory
		SceneChanger.changeScene("Scenes/Victory.tscn")
	else:
		LevelState.setCurrentLevel(nextLevel);
		LevelState.setPlayState(LevelState.playstate.nextlevel);
