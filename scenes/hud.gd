extends CanvasLayer

@onready var honey_counter_label: Label = %HoneyCounterLabel
@onready var coins_counter_label: Label = %CoinsCounterLabel
@onready var bee_counter_label: Label = %BeeCounterLabel
@onready var beehive_counter_label: Label = %BeehiveCounterLabel
@onready var camera: Camera2D = %Camera2D

@onready var beehive_shop: GridContainer = %BeehiveShop

func _ready() -> void:
	EventBus.honey_changed.connect(honey_update)
	EventBus.coin_changed.connect(coins_update)
	EventBus.bee_changed.connect(bee_update)
	EventBus.beehive_changed.connect(beehive_update)

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.button_index == 4 and camera.zoom < Vector2(2.0, 2.0):
			camera.zoom += Vector2(0.1, 0.1)
			
			if camera.zoom >= Vector2(1.4, 1.4):
				Globals.bee_speed  = 0.1
				
		elif event.button_index == 5 and camera.zoom > Vector2(1.0, 1.0):
			camera.zoom -= Vector2(0.1, 0.1)
			Globals.bee_speed  = randf_range(1.2, 2.0)

## Scroll into beehive container
	#if event is InputEventMouseMotion and camera.zoom > Vector2(1.2, 1.2):
		#if event.screen_velocity.x > 0:
	#if Input.is_action_pressed("ui_right") and camera.zoom > Vector2(1.2, 1.2):
			#camera.offset.x += 5.0
			#if camera.offset.x >= 78.0:
				#camera.offset.x = 78.0
	#elif Input.is_action_pressed("ui_left") and camera.zoom > Vector2(1.2, 1.2):
		#if event.velocity.x < 0:
			#camera.offset.x -= 5.0
			#if camera.offset.x <= -104.0:
				#camera.offset.x = -104.0
	#elif camera.zoom <= Vector2(1.2, 1.2):
		#camera.offset.x = 0.0

func honey_update(honey_points: int):
	honey_counter_label.text = str(honey_points)
	
func coins_update(coins: int):
	coins_counter_label.text = str(coins)

func bee_update(bee: int):
	bee_counter_label.text = str(bee)

func beehive_update(beehive: int):
	beehive_counter_label.text = str(beehive)
