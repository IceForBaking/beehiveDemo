extends HBoxContainer

@export var beehive_scene := preload("res://scenes/beehive.tscn")
@onready var spawn_point: Marker2D = %SpawnPoint

var bee_scene = preload("res://scenes/bee.tscn")

func bee_spawn():
	var bee = bee_scene.instantiate()
	bee.center = spawn_point.global_position
	get_parent().add_child(bee)

func _on_shop_beehive_beehive_spawn() -> void:
	var beehive = beehive_scene.instantiate()
	add_child(beehive)
	
