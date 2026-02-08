class_name Bee extends Area2D

@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var update_from_bee := 1
@export var level : int = 1

var is_dragging = false
var is_merging = false

var time := 0.0
var speed := randf_range(1.2, 2.0)  
var a_size := randf_range(-200, 200) 
var b_size := randf_range(-100, 100)  

var offset = Vector2(0,0)

@export var center : Vector2 = Vector2()

func _ready() -> void:
	audio_stream_player.pitch_scale = randf_range(0.5, 1.2)

func _process(delta):
	
	if is_dragging:
		position = get_global_mouse_position() - offset
	else:
		randomize()
		time += delta * Globals.bee_speed
		var x = a_size * sin(time)
		var y = b_size * sin(time) * cos(time)
		position = center + Vector2(x, y)
		
		var dx = a_size * cos(time) * Globals.bee_speed
		var dy = b_size * (cos(time)*cos(time) - sin(time)*sin(time)) * Globals.bee_speed
		
		if Vector2(dx, dy).length() > 0:
			rotation = Vector2(dx, dy).angle()
			
func merg_obj(other_merge_obj):
	
	var spawn_pos = global_position
	MergeManager.spawn_merge_obj(spawn_pos, level)
	
	if level != MergeManager.max_level:
		other_merge_obj.queue_free()
		queue_free()
		
func _on_timer_timeout() -> void:
	Globals.honey_points_update(update_from_bee)
	
func _on_button_button_down() -> void:
	z_index = 1
	is_dragging = true
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	z_index = 0
	is_dragging = false

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("merge"):
		if area.level == level:
			if area.get_instance_id() > get_instance_id():
				return
			call_deferred("merg_obj", area)
