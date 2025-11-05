extends HBoxContainer

@onready var color_rect: ColorRect = $ColorRect

var tween : Tween 

func _ready() -> void:
	color_rect.modulate = Color.TRANSPARENT

func anim(color: Color):
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(color_rect, "modulate", color, 1)
	
func _on_color_rect_mouse_entered() -> void:
	anim(Color.ORANGE)

func _on_color_rect_mouse_exited() -> void:
	anim(Color.TRANSPARENT)
	
