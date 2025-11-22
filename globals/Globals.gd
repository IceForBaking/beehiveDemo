extends Node

const RESET_BEE_COUNT := -10

var honey_points := 0
var for_sell_honey := 10

var coins := 0
var coins_for_purchase := 100

var current_bee := 0
var max_bee := 10

var beehive := 1
var max_beehive := 4

func honey_points_update(amount: int):
	honey_points += amount
	EventBus.honey_changed.emit(honey_points)

func coins_update(amount: int):
	coins += amount
	EventBus.coin_changed.emit(coins)
	
func bee_update(amount: int):
	current_bee += amount
	EventBus.bee_changed.emit(current_bee)

func beehive_update(amount: int):
		beehive += amount
		EventBus.beehive_changed.emit(beehive)
		
