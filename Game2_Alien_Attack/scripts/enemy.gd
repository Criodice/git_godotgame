extends Area2D

@export var speed = 200 ;

func _physics_process(delta):
	global_position.x += -speed * delta ;
