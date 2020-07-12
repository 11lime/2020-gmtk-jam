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
	
	# give some space to the top to prevent claustrophic feeling	
	var offsetPosition = tileMapDimension.position - Vector2(0, 3);
	
	var topLeftWithOffset = Vector2(tileSize * offsetPosition);
	var mapDimension = Rect2(topLeftWithOffset, tileSize * tileMapDimension.size);
	
	camera.limit_left = mapDimension.position.x;
	camera.limit_top = mapDimension.position.y;
	camera.limit_right = mapDimension.end.x;
	camera.limit_bottom = mapDimension.end.y;
	
	parallaxBackground.scroll_limit_begin = mapDimension.position;
	parallaxBackground.scroll_limit_end = mapDimension.end;
