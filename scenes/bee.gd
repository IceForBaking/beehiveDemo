extends Area2D

var time := 0.0
var speed := randf_range(1.2, 2.0)  
var a_size := randf_range(-200, 200) 
var b_size := randf_range(-100, 100)  
var center := Vector2()
var update_from_bee := 1

func _ready() -> void:
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.5, 1.2)

func _process(delta):
	randomize()
	time += delta * speed
	var x = a_size * sin(time)
	var y = b_size * sin(time) * cos(time)
	position = center + Vector2(x, y)
	
	var dx = a_size * cos(time) * speed
	var dy = b_size * (cos(time)*cos(time) - sin(time)*sin(time)) * speed
	
	if Vector2(dx, dy).length() > 0:
		rotation = Vector2(dx, dy).angle()
	
func _on_timer_timeout() -> void:
	Globals.honey_points_update(update_from_bee)
