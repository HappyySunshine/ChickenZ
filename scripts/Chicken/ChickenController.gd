class_name ChickenController extends CharacterBody2D


const SPEED = 100.0
@onready var animation: ChickenAnimationController = $Animation
enum State{Idle, Attacking, Moving, Default}
var state = State.Default
var attack: ChickenAttackController
const fetaher = preload("res://scenes/feather.tscn")
const sparks = preload("res://scenes/sparks.tscn")
var attack_delay = 0.3

func _ready():
	attack = ChickenAttackController.new()
	attack.setup(get_tree())

func set_state(new_state: State):
	if new_state == state:
		return
	state = new_state
	animation.animate()
	

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_world_pos = get_viewport().get_camera_2d().get_global_mouse_position()
		attack.attack(mouse_world_pos, position, event.button_index)
		set_state(State.Attacking)
		#await get_tree().create_timer(attack_delay).timeout
		#set_state(State.Default)
		
		
func _process(delta: float) -> void:
	if state == State.Attacking:
		return
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
		set_state(State.Moving)
	else:
		set_state(State.Idle)
	velocity = Vector2(direction.x * SPEED, direction.y * SPEED)
	move_and_slide()
