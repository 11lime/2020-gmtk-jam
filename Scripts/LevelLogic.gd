extends Node2D

onready var tileMap : TileMap = $TileMap
onready var parallaxBackground : ParallaxBackground = $ParallaxBackground
onready var camera : Camera2D = $Player/Ghost/Camera2D

func _ready():
	restrictCamera();

# restricts the camera to the TileMap dimensions
func restrictCamera():
	var tileMapDimension : Rect2 = tileMap.get_used_rect();
	var tileSize = tileMap.cell_size;
	
	var realTopLeft = Vector2(tileSize * tileMapDimension.position);
	var realMapDimension = Rect2(realTopLeft, tileSize * tileMapDimension.size);
	
	camera.limit_left = realMapDimension.position.x;
	camera.limit_top = realMapDimension.position.y;
	camera.limit_right = realMapDimension.end.x;
	camera.limit_bottom = realMapDimension.end.y;
	
	parallaxBackground.scroll_limit_begin = realMapDimension.position;
	parallaxBackground.scroll_limit_end = realMapDimension.end;
