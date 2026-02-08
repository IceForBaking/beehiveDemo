extends HBoxContainer

@onready var color_rect: ColorRect = $ColorRect

var tween : Tween 

func _ready() -> void:
	color_rect.modulate = Color.TRANSPARENT

func anim(color: Color, z_index : int):
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(color_rect, "modulate", color, 1)
	color_rect.z_index = z_index

func _on_color_rect_mouse_entered() -> void:
	anim(Color.ORANGE, 1)

func _on_color_rect_mouse_exited() -> void:
	anim(Color.TRANSPARENT, 0)
	
func _on_h_scroll_bar_mouse_entered() -> void:
	anim(Color.ORANGE, 1)

func _on_h_scroll_bar_mouse_exited() -> void:
	anim(Color.TRANSPARENT, 0)

func _on_check_button_mouse_entered() -> void:
	anim(Color.ORANGE, 1)

func _on_check_button_mouse_exited() -> void:
	anim(Color.TRANSPARENT, 0)
