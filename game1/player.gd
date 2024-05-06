extends RigidBody2D

var force = 250 ;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

func _process(delta):
	#print(Engine.get_frames_per_second());
	#apply_force(Vector2(25,0));
	pass

func _physics_process(delta):
	#print(Input.is_action_pressed("move_left"))
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-force,0));
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(force,0));
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0,-force));
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2(0,force));

func test():
	var t = 10 ;
	return (t+10);
