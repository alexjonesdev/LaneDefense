extends StaticBody2D

@export var direction: Vector2 = Vector2.UP
@export var is_player: bool = false
var SPAWN_LOC: Vector2 = Vector2.UP
var energy_per_second: int = 10
var energy_amount = 0:
	set(value):
		energy_amount = value
		if energy_amount > Globals.MAX_ENERGY: energy_amount = Globals.MAX_ENERGY
		player_stat_change.emit(energy_amount)

signal player_stat_change(energy_amount)
signal base_spawn_unit(unit_type, pos, direction)

func player_input():
	if Input.is_action_just_pressed("unit0"):
		if energy_amount >= Globals.UNITS_COSTS["upgrade"]:
			energy_per_second += 5
			energy_amount -= Globals.UNITS_COSTS["upgrade"]

	if Input.is_action_just_pressed("unit1"):
		if energy_amount >= Globals.UNITS_COSTS["soldier"]:
			base_spawn_unit.emit("soldier", SPAWN_LOC, direction)
			energy_amount -= Globals.UNITS_COSTS["soldier"]
		
func run_ai(_difficulty:int):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	SPAWN_LOC = self.global_position + Vector2(50,0) * direction
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_player:
		player_input()
	else:
		run_ai(1)

# Events
func _on_timer_timeout():
	energy_amount += energy_per_second
