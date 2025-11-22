extends CanvasLayer

@onready var honey_counter_label: Label = %HoneyCounterLabel
@onready var coins_counter_label: Label = %CoinsCounterLabel
@onready var bee_counter_label: Label = %BeeCounterLabel
@onready var beehive_counter_label: Label = %BeehiveCounterLabel

@onready var beehive_shop: GridContainer = %BeehiveShop

func _ready() -> void:
	EventBus.honey_changed.connect(honey_update)
	EventBus.coin_changed.connect(coins_update)
	EventBus.bee_changed.connect(bee_update)
	EventBus.beehive_changed.connect(beehive_update)
	
func honey_update(honey_points: int):
	honey_counter_label.text = str(honey_points)
	
func coins_update(coins: int):
	coins_counter_label.text = str(coins)

func bee_update(bee: int):
	bee_counter_label.text = str(bee)

func beehive_update(beehive: int):
	beehive_counter_label.text = str(beehive)
