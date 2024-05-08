extends Control




func set_score(new_score):
	$Panel/GAMESCORE.text ="SCORE: "+ str(new_score)
	
	
	
func _on_retry_button_pressed():
	#print("retry  button")
	get_tree().reload_current_scene()
