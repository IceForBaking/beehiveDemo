extends HBoxContainer

@export var beehive_scene := preload("uid://by5jamv1ubi0f")
@onready var spawn_point: Marker2D = %SpawnPoint

var bee_scene = preload("uid://mo4hdvyu6uif")

var beehive_update := 1

func bee_spawn():
	var bee = bee_scene.instantiate()
	bee.center = spawn_point.global_position
	get_parent().add_child(bee)

func _on_shop_beehive_beehive_spawn() -> void:
	if Globals.beehive != Globals.max_beehive:
		var beehive = beehive_scene.instantiate()
		add_child(beehive)
		Globals.beehive_update(beehive_update)
		Globals.bee_update(Globals.RESET_BEE_COUNT)

		
