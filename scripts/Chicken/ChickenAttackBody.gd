class_name ChickenAttackBody extends RigidBody2D



var current_pos = Vector2.ZERO
var start
var end
var speed
var direction
var range = 2
var angle
func setup(start,end,speed, direction, angle):
	position = start
	self.angle = angle
	linear_velocity = direction * speed * 10

	
func _ready() -> void:
	$feather.call_deferred("set_rotation", angle)
	get_tree().create_timer(range /2).timeout.connect(func():
		$feather.play("dissolve")
		)
	

	
	#await get_tree().create_timer(1.0).timeout
	#queue_free()

func _physics_process(delta: float) -> void:
	$CollisionShape2D.rotation = angle
	

	
	pass


func _on_feather_animation_finished() -> void:
	if $feather.animation == "dissolve":
		queue_free()
	pass # Replace with function body.
