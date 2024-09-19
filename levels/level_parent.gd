extends Node
class_name LevelParent

var soldier_scene: PackedScene = preload("res://units/soldier.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for base in get_tree().get_nodes_in_group('bases'):
		base.connect('base_spawn_unit', spawn_unit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		pass

func spawn_unit(unit, pos, direction):
	if unit == "soldier":
		var soldier = soldier_scene.instantiate() as CharacterBody2D
		soldier.position = pos
		soldier.direction = direction
		$Units.add_child(soldier)
		print(unit, pos, direction)
