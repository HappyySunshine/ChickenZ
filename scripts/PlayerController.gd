extends CharacterBody2D


const SPEED = 100.0
@onready var animation = $Animation



func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("up"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
		
		
	if velocity.x != 0 or velocity.y !=0:
		animation.set_state(animation.AnimationState.Movement)
	else:
		animation.set_state(animation.AnimationState.Idle)
		
	velocity = Vector2(direction.x * SPEED, direction.y * SPEED)
	move_and_slide()
