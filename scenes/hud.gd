extends CanvasLayer

@onready var honey_counter_label: Label = %HoneyCounterLabel

func _ready() -> void:
	EventBus.honey_changed.connect(honey_update)

func honey_update(honey_points: int):
	honey_counter_label.text = str(honey_points)
	
