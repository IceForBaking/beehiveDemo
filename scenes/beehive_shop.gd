extends GridContainer

@onready var spawn_point: Marker2D = %SpawnPoint
@onready var beehive_container: HBoxContainer = %BeehiveContainer
@onready var buy_bee_button: Button = %BuyBeeButton
@onready var beehive_buying_button: TextureRect = %BeehiveBuyingButton

var honey_seller := -10
var coins_update := 1000
var coins_reset := -100
var bee_update := 1

func spawn_point_updater():
	spawn_point.position = Vector2(randf_range(0, beehive_container.size.x), randf_range(0, beehive_container.size.y))
	print(spawn_point.position)
	beehive_container.bee_spawn()
	
func _on_buy_bee_button_pressed() -> void:
	if Globals.coins >= Globals.coins_for_purchase:
		Globals.coins_update(coins_reset)
		Globals.bee_update(bee_update)
		spawn_point_updater()
		if  Globals.current_bee == Globals.max_bee:
			buy_bee_button.disabled = true

func _on_sell_honey_button_pressed() -> void:
	if Globals.honey_points >= Globals.for_sell_honey:
		Globals.honey_points_update(honey_seller)
		Globals.coins_update(coins_update)

func _on_beehive_buying_button_check_max_beehives() -> void:
	if Globals.beehive == Globals.max_beehive:
		if Globals.current_bee >= Globals.max_bee:
			buy_bee_button.disabled = true
	elif Globals.current_bee < Globals.max_bee:
		buy_bee_button.disabled = false
