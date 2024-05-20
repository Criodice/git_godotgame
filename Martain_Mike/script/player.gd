extends CharacterBody2D

class_name Player

@export var SPEED = 125
@export var jump_force = 200

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var gravity = 400

@onready var animated_sprite =$AnimatedSprite2D

var active = true
func _physics_process(delta):
	# Add the gravity.
	if is_on_floor() ==false:
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") && is_on_floor():
		jump(jump_force) 

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#input 
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0 : 
		#精灵反转
		animated_sprite.flip_h=(direction == -1)
	#if direction:
	velocity.x = direction * SPEED

	move_and_slide()
	update_animatedSprite(direction)

func jump(force):
	velocity.y =- force

func update_animatedSprite(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y< 0 :
			animated_sprite.play("jump")
		else :
			animated_sprite.play("fall")

