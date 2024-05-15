extends Node2D

@onready var   start_position = $StartPosition
@onready var player = $Player
func _ready():
	var traps = get_tree().get_nodes_in_group("Level")
	print(traps)
	
	
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()



func _on_deathzone_body_entered(body):
	#print("enter  :"+ str(body))
	#body.get_tree().restart()
	#body.velocity =Vector2.ZERO
	#body.global_position =start_position.global_position
	reset_player()


func _on_trap_touched_player():
	reset_player()

func reset_player():
	player.velocity =Vector2.ZERO
	player.global_position =start_position.global_position


