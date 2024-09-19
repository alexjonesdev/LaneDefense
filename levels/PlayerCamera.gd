extends Camera2D

@export var speed: int = 400
const MIN_X: int = 640
const MAX_X: int = 1470

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
		if position.x < MIN_X:
			position.x = MIN_X

	if Input.is_action_pressed("right"):
		position.x += speed * delta
		if position.x > MAX_X:
			position.x = MAX_X
