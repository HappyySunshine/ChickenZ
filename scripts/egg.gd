extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RigidBody2D.gravity_scale = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	print(body)
	pass # Replace with function body.
