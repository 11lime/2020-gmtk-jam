extends Node

func changeScene(path):
	var result = get_tree().change_scene(path);
	# assert only works in debug mode
	assert(result == OK)
