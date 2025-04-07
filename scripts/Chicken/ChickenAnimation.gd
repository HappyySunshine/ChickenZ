class_name ChickenAnimationController extends AnimatedSprite2D



enum State{ Idle, Movement, Attack}
var current = State.Idle
@onready var chicken: ChickenController  = $"..";

func animate():
	if chicken.state == ChickenController.State.Idle:
		play("Idle")
		pass
	if chicken.state == ChickenController.State.Moving:
		play("Movement")
	if chicken.state == ChickenController.State.Attacking:
		play("attack")
		await animation_finished
		print("banana")
		
func set_state(state:State):
	if state == current:
		return
	if state == State.Idle:
		play("Idle")
		pass
	if state == State.Movement:
		play("Movement")
		
	current = state
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_finished() -> void:
	print("attac")
	if chicken.state == ChickenController.State.Attacking:
		chicken.set_state(ChickenController.State.Default)
	  
	pass # Replace with function body.
