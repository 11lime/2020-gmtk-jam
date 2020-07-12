extends Node2D

export var nextLevel : String

func _on_Area2D_body_entered(body):
	var levelPath = "res://Scenes/Levels/" + nextLevel + ".tscn";
	LevelState.currentLevel = levelPath;
	LevelState.setPlayState(LevelState.playstate.nextlevel);
