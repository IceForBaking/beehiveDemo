extends Node2D

@onready var coin_label: Label = $CanvasLayer/BeehiveUI/DataInt/HBoxContainer/Label2
@onready var label: Label = $CanvasLayer/BeehiveUI/DataInt/HBoxContainer/Label
@onready var beehive_container: HBoxContainer = $CanvasLayer/BeehiveUI/BeehiveContainer
@onready var spawn_point: Marker2D = %SpawnPoint
@onready var bee_label: Label = $CanvasLayer/BeehiveUI/DataInt/HBoxContainer/Label3
@onready var button: Button = $CanvasLayer/BeehiveUI/BeehiveShop/Button

func _process(delta: float) -> void:
	label.text = str(Globals.honey_points)
	coin_label.text = str(Globals.coins)
	bee_label.text = str(Globals.current_bee)
	
func _on_button_2_pressed() -> void:
	if Globals.honey_points >= 10:
		Globals.honey_points -= 10
		Globals.coins += 10000
		
func _on_button_pressed() -> void:
	
	spawn_point.position = Vector2(randf_range(0, beehive_container.size.x), randf_range(0, beehive_container.size.y))
	print(spawn_point.position)
	
	if Globals.coins >= 100:
		Globals.coins -= 100
		beehive_container.bee_spawn()
		Globals.current_bee += 1
	
	if Globals.current_bee >= Globals.max_bee:
		button.disabled = true
