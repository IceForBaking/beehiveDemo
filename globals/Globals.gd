extends Node

const RESET_BEE_COUNT := 0

var honey_points := 0
var coins := 0
var max_bee := 10
var current_bee := 0

func honey_points_update(amount: int):
	honey_points += amount
	EventBus.honey_changed.emit(honey_points)
