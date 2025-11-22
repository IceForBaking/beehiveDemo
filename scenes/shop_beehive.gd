extends TextureRect

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var tween : Tween
var is_used := true
var current_state = BUY_STATE.NOT_ACTIVE
 
signal beehive_spawn
signal check_max_beehives

enum BUY_STATE {
	ACTIVE,
	NOT_ACTIVE
}

func _process(_delta: float) -> void:
	
	match current_state:
		BUY_STATE.NOT_ACTIVE:
			modulate = Color("ffffff83")
			anim(0.0, 0.0, false, 1)
		BUY_STATE.ACTIVE:
			modulate = Color("ffffff")
			
	if Globals.current_bee >= Globals.max_bee:
		current_state = BUY_STATE.ACTIVE
	else:
		current_state = BUY_STATE.NOT_ACTIVE
			
func anim(deg: float, duration: float,  is_loops: bool, tween_switch: int):
	
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "rotation", deg, duration)
	
	if is_loops:
		tween.set_loops(-1)
	
	match tween_switch:
		1:
			tween.tween_property(self, "rotation", -deg, duration)

func _on_mouse_entered() -> void:
	anim(0.5, 0.5, true, 1)

func _on_mouse_exited() -> void:
	anim(0, 0.5, false, false)

func _on_gui_input(event: InputEvent) -> void:
	
	if is_used == true and Globals.current_bee >= Globals.max_bee:
		
		if event is InputEventMouseButton:
			
			if event.button_mask == MOUSE_BUTTON_LEFT and event.is_pressed():
				is_used = false
				
				beehive_spawn.emit()
				animation_player.play("hide")
				await get_tree().create_timer(1).timeout
				animation_player.play("show")
				
				is_used = true

				check_max_beehives.emit()
