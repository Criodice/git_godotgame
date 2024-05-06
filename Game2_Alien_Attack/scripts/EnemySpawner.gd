extends Node2D

var enemy_scenc = preload("res://scences/enemy.tscn")

@onready var spawn_positions =$SpawnPositions

func _on_timer_timeout():
	#print("Timeout")
	spawn_enemy()

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	
	var random_spawn_positions =spawn_positions_array.pick_random()
	var enemy_instance = enemy_scenc.instantiate()
	#enemy_instance.global_position = Vector2(1350,300)
	enemy_instance.global_position  = random_spawn_positions.global_position
	add_child(enemy_instance)
