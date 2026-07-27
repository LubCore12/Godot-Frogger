extends Area2D

var direction: Vector2 = Vector2.LEFT
var speed: int = 120
var colors: Array = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png")
]

func _ready() -> void:
	$Sprite.texture = colors.pick_random()
	if position.x < 0:
		direction = Vector2.RIGHT
		$Sprite.flip_h = true

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(_body: Node2D) -> void:
	pass
