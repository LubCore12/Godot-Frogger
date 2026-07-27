extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")
var time_count: int = 0

func change_scene():
	get_tree().change_scene_to_file("res://scenes/restart_screen.tscn" )

func _on_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene")
	
	if (Global.score is String) or time_count < Global.score:
		Global.score = time_count

func _on_car_timer_timeout() -> void:
	var car: = car_scene.instantiate() as Area2D
	var position_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = position_marker.position
	$Objects/Cars.add_child(car)
	car.connect("body_entered", go_to_title)
	
func go_to_title(_body):
	call_deferred("change_scene")

func _on_map_area_area_exited(area: Area2D) -> void:
	area.queue_free()

func _on_score_timer_timeout() -> void:
	time_count += 1
	$UI/Score.text = "Score: {score}".format({"score": time_count})
