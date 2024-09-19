extends CharacterBody2D

enum STATE {WALK, SHOOT, DIE}
@export var speed: int = 100
var direction: Vector2 = Vector2.UP
var state: STATE = STATE.WALK 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	if state == STATE.WALK:
		$AnimationPlayer.play("walk")
