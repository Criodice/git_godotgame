extends Control

@onready var score = $Score

@onready var life = $Current_life

@onready  var game_over =  $game_over
func set_score_label(new_score):
	score.text ="SCORE: "+ str(new_score)


func set_current_life(current_life):
	life.text =str(current_life)
	
func set_game_over(str_game_over):
	game_over.text = str(str_game_over)
