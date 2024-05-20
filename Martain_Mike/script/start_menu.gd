extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scene/level.tscn")


func _on_quit_pressed():
	get_tree().quit()
