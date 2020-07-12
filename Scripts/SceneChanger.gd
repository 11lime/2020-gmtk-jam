extends Node

func changeScene(path):
	assert(get_tree().change_scene(path) == OK)
