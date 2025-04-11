class_name EntityController extends CharacterBody2D


var delay  = 2
const SPEED = 10
var direction = Vector2.ZERO
var moving = false


func thonk() -> void:
	var timer = get_tree().create_timer(delay)
	timer.timeout.connect(func():
		direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0,1.0))
		var time  = randf_range(0.0, 2.0)
		$AnimatedSprite2D.play("walk")
		if direction.x < 0.0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
			
		velocity  = direction * SPEED
		var new_timer = get_tree().create_timer(time)
		new_timer.timeout.connect(func():
			velocity = Vector2.ZERO
			$AnimatedSprite2D.play("default")
			thonk()
			)
		)
	
func _ready() -> void:
	thonk()
	




func _physics_process(delta: float) -> void:
	move_and_slide()
