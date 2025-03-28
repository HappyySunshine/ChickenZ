class_name Attack extends RigidBody2D



var current_pos
var end
var speed
var direction

func setup(start,end,speed, direction):
	self.current_pos = start
	self.end = end
	self.speed = speed
	self.direction =  direction
	position = current_pos

func _physics_process(delta: float) -> void:
	var vec = Vector2(1,0)
	position +=  vec * 10 * delta
	pass
