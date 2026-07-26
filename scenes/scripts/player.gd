extends CharacterBody2D


var direction: Vector2
var speed: int = 100

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = speed * direction
	animation()
	move_and_slide()
	
	if Input.is_action_just_pressed("confirm"):
		print("something")
		
func animation():
	if direction:
		if direction.x:
			$Animation.animation = "left"
			$Animation.flip_h = direction.x > 0	
		else:
			$Animation.animation = "up" if direction.y < 0 else "down"
	else:
		$Animation.frame = 0
