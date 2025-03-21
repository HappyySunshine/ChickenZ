extends AnimatedSprite2D



enum AnimationState{ Idle, Movement}
var current = AnimationState.Idle


func set_state(state:AnimationState):
	if state == current:
		return
	if state == AnimationState.Idle:
		play("Idle")
		pass
	if state == AnimationState.Movement:
		play("Movement")
	current = state
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
