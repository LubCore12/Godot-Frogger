extends CharacterBody2D

var direction: Vector2
var speed: int = 100
var is_stoped = false

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = speed * direction
	animation()
	move_and_slide()
		
func animation():
	if direction:
		if is_stoped:
			is_stoped = false
			$Animation.frame = 1
			
		if direction.x:
			$Animation.animation = "left"
			$Animation.flip_h = direction.x > 0	
		else:
			$Animation.animation = "up" if direction.y < 0 else "down"
	else:
		is_stoped = true
		$Animation.frame = 0
