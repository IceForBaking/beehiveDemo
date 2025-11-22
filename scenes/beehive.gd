extends TextureButton
class_name Beehive

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var particle := preload("uid://ct7oxmlgd00cn")

var bee_points_updater := 1
var is_picking := false

func honey_spawn(pos: Vector2) -> void:
	var honey = particle.instantiate()
	honey.global_position = pos
	honey.emitting = true
	add_child(honey)

func _on_mouse_entered() -> void:
	if is_picking == false:
		animation_player.play("zoom")
		await animation_player.animation_finished

func _on_mouse_exited() -> void:
	if is_picking == false:
		await get_tree().create_timer(0.2).timeout
		animation_player.play("resize")

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_picking == false:
		if event.button_mask == MOUSE_BUTTON_LEFT and event.is_pressed():
			Globals.honey_points_update(bee_points_updater)
			honey_spawn(get_local_mouse_position())
			await get_tree().create_timer(0.2).timeout
			animation_player.play("drag")

	
