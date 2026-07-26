extends CharacterBody2D


var direction: Vector2
var speed: int = 100

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = speed * direction
	move_and_slide()
	
	if Input.is_action_just_pressed("confirm"):
		print("something")
