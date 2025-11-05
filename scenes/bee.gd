extends Area2D

var time := 0.0
var speed := 2.0  
var a_size := 200 
var b_size := 100  
var center := Vector2()

func _process(delta):
	randomize()
	time += delta * speed
	var x = a_size * sin(time)
	var y = b_size * sin(time) * cos(time)
	position = center + Vector2(x, y)
	
func _on_timer_timeout() -> void:
	Globals.honey_points += 1
