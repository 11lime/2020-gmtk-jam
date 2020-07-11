extends TileMap

func _on_Target_Collision_signal(target, collision, tileNumber):
	if collision.normal == Vector2.DOWN: # means collide to the top
		handleTopCollision(target, tileNumber);
	elif collision.normal == Vector2.UP: # means collide with ground
		handleGroundCollision(target, tileNumber);
	elif collision.normal == Vector2.LEFT: # means collide to the right
		handleRightCollision(target, tileNumber); 
	elif collision.normal == Vector2.RIGHT: # means collide to the left
		handleLeftCollision(target, tileNumber);

func handleVerticalCollision(target, directionModifier : int, tileNumber):
	var collisionShape = target.get_node("CollisionShape2D");
	var boundSize = collisionShape.shape.extents;
	
	var leftPoint = target.global_position + Vector2(-boundSize.x, directionModifier * boundSize.y);
	var rightPoint = target.global_position + Vector2(boundSize.x, directionModifier * boundSize.y);
	
	var targetTilePos = world_to_map(target.global_position);
	var leftTilePos = world_to_map(leftPoint);
	var rightTilePos = world_to_map(rightPoint);
	
	var tilesCovered = rightTilePos.x - leftTilePos.x + 1;
	
	for i in range(tilesCovered):
		var tileCoords = Vector2(leftTilePos.x + i, targetTilePos.y + directionModifier);
		if get_cellv(tileCoords) > -1:
			set_cellv(tileCoords, tileNumber);

func handleGroundCollision(target, tileNumber):
	handleVerticalCollision(target, 1, tileNumber);

func handleTopCollision(target, tileNumber):
	handleVerticalCollision(target, -1, tileNumber);

func handleHorizontalCollision(target, directionModifier : int, tileNumber):
	var collisionShape = target.get_node("CollisionShape2D");
	var boundSize = collisionShape.shape.extents;
	
	var topPoint = target.global_position + Vector2(directionModifier * boundSize.x, -boundSize.y);
	var bottomPoint = target.global_position + Vector2(directionModifier * boundSize.x, boundSize.y);
	
	var targetTilePos = world_to_map(target.global_position);
	var topTilePos = world_to_map(topPoint);
	var bottomTilePos = world_to_map(bottomPoint);
	
	var tilesCovered = bottomTilePos.y - topTilePos.y + 1;
	
	for i in range(tilesCovered):
		var tileCoords = Vector2(targetTilePos.x + directionModifier, targetTilePos.y + i);
		print(tileCoords);
		if get_cellv(tileCoords) > -1:
			set_cellv(tileCoords, tileNumber);

func handleLeftCollision(target, tileNumber):
	handleHorizontalCollision(target, -1, tileNumber);

func handleRightCollision(target, tileNumber):
	handleHorizontalCollision(target, 1, tileNumber);
