extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")

func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("player entered")

func _on_car_timer_timeout() -> void:
	var car: = car_scene.instantiate() as Area2D
	var position_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = position_marker.position
	$Objects/Cars.add_child(car)
	car.connect("body_entered", go_to_title)
	
func go_to_title(body):
	print("player collide")

func _on_map_area_area_exited(area: Area2D) -> void:
	area.queue_free()
