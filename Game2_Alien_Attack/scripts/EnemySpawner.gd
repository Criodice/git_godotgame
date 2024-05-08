extends Node2D

var enemy_scenc = preload("res://scences/enemy.tscn")
var path_enemy_scene = preload("res://scences/path_enemy.tscn")

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)
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
	#add_child(enemy_instance)
	emit_signal("enemy_spawned",enemy_instance)


func _on_timer_2_timeout():
	spawn_Path_Enemy() # Replace with function body.
	print("生成路径")
func spawn_Path_Enemy():
	var path_enemy_instance =path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned",path_enemy_instance)
	
