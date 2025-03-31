class_name ChickenAttackBody extends RigidBody2D



var current_pos = Vector2.ZERO
var start
var end
var speed
var direction
var range = 10

func setup(start,end,speed, direction):
	position = start
	linear_velocity = direction * speed * 10

	
func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	queue_free()

func _physics_process(delta: float) -> void:

	
	pass
