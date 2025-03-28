extends CharacterBody2D


const SPEED = 100.0
@onready var animation = $Animation
var attack: PlayerAttack
const fetaher = preload("res://scenes/feather.tscn")
const sparks = preload("res://scenes/sparks.tscn")

func _ready():
	attack = PlayerAttack.new()
	attack.setup(get_tree())

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_world_pos = get_viewport().get_camera_2d().get_global_mouse_position()
		attack.attack(mouse_world_pos, position, event.button_index)
		
func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1		
	if velocity.x != 0 or velocity.y !=0:
		animation.set_state(animation.AnimationState.Movement)
	else:
		animation.set_state(animation.AnimationState.Idle)
	

	velocity = Vector2(direction.x * SPEED, direction.y * SPEED)
	move_and_slide()
