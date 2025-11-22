extends Node2D

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	print(mouse_pos)
