extends Area2D

var direction: Vector2 = Vector2.LEFT
var speed: int = 120

func _ready() -> void:
	if position.x < 0:
		direction = Vector2.RIGHT
		$Sprite.flip_h = true

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	pass
