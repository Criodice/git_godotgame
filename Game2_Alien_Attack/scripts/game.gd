extends Node2D


@export var live = 3 ;

var score = 0 

@onready var player =$Player
@onready var hud = $UI/hud
@onready var ui = $UI
@onready  var enemy_hit_Sound = $EnemyHitSound
@onready var  die_hit_sound  = $DidHitSound
var gos_scene = preload("res://scences/game_over_screen.tscn")
func _ready():
	hud.set_score_label(0)

func _on_player_took_damage():
	live -=1
	die_hit_sound.play()
	hud.set_current_life(live)
	if (live == 0):
		#hud.set_game_over("game over")
		print("game over")
		
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		
		var gos = gos_scene.instantiate()
		gos.set_score(score)
		ui.add_child(gos)
	else :
		print(live)


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died",_on_enemy_died)
	add_child(enemy_instance)
	
func _on_enemy_died():
	score +=100
	#print("Score : " + str(score))
	hud.set_score_label(score)
	enemy_hit_Sound.play()


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
# Replace with function body.
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died",_on_enemy_died )
