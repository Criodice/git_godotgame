extends CharacterBody2D


var speed = 300

var rocket_scene = preload("res://scences/rocket.tscn");

@onready var rocket_container =$RocketContainer #get_node("RocketContainer")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot();
		

func _physics_process(delta):
	velocity =Vector2(0,0);
	if Input.is_action_pressed("move_right"):
		velocity.x =speed ;
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed;
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed;
	if Input.is_action_pressed("move_down"):
		velocity.y = speed;
	move_and_slide();
	#print(global_position);
	
	
	#边界 1
	var screen_size = get_viewport_rect().size;
	#if global_position.x < 0 :
		#global_position.x=0;
	#if global_position.x > screen_size.x :
		#global_position.x=screen_size.x ;
	#if global_position.y < 0:
		#global_position.y = 0;
	#if global_position.y > screen_size.y:
		#global_position.y=screen_size.y;
		
		#边界 2
	#global_position.x = clamp(global_position.x,0,screen_size.x);
	#global_position.y = clamp(global_position.y ,0 ,screen_size.y);
	#边界 3
	
	global_position = global_position.clamp(Vector2(0,0) ,screen_size);

func shoot():
	#print("shoot");
	#var rocket_scene = load("res://scences/rocket.tscn");
	var rocket_instance = rocket_scene.instantiate();
	#add_child(rocket_instance);
	rocket_container.add_child(rocket_instance);
	rocket_instance.global_position  =  global_position ;
	rocket_instance.global_position.x +=50 ;
