extends Area2D

@onready var exit_animated_sprite = $AnimatedSprite2D

func _ready():
	#animate()
	pass
func animate():
	exit_animated_sprite.play("EndPressed")
	
