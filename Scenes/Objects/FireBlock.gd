extends TextureRect

onready var collision = $FireBlockCollision/CollisionShape2D

func _ready():
	var textureRect = self.get_size();
	collision.position = textureRect / 2;
	collision.shape.extents = textureRect / 2 - Vector2(3, 0);	
