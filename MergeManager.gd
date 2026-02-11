extends Node

var max_level : int = 3

var merge_obg : Array[PackedScene] = [
	preload("res://scenes/bee.tscn"),
	preload("res://scenes/bee2.tscn"),
	preload("res://scenes/bee3.tscn"),
]

func spawn_merge_obj(pos : Vector2, current_level : int):
	if current_level < merge_obg.size():
		var new_merge_obg = merge_obg[current_level].instantiate()
		new_merge_obg.global_position = pos
		
		call_deferred("add_child_to_game", new_merge_obg)
	
func add_child_to_game(merge_obj_node):
	get_tree().current_scene.add_child(merge_obj_node)
