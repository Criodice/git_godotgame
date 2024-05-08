extends Area2D





func _on_area_entered(area):
	#print(area.name) # Replace with function body.
	#area.die();
	area.queue_free()



