class_name ChickenAttackController extends Node

class Attack:
	var speed = 10
	var range = 10
	var damage = 10


var speed = 10
var range = 10
var damage = 10

enum Attac{Left, Right}
var is_attacking = false;
var tree: SceneTree;

func setup(tre):
	tree = tre;

func attack(mouse_pos: Vector2,player_pos: Vector2, index: MouseButton ):
	
	var vec: Vector2 = (mouse_pos - player_pos).normalized()
	var destination = player_pos + vec * range *10
	var attack : ChickenAttackBody = preload("res://scenes/attack.tscn").instantiate()
	attack.setup(player_pos, destination, speed, vec)
	tree.root.call_deferred("add_child", attack)

	pass

func _physics_process(delta):
	pass
