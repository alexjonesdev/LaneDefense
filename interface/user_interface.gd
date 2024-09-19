extends CanvasLayer

@onready var energy_text: Label = $EnergyControl/VBoxContainer/Label
@onready var energy_bar: TextureProgressBar = $EnergyControl/VBoxContainer/TextureProgressBar

#func _ready():
	#Globals.connect('player_stat_change', update_stats)
	#update_energy(energy)

func update_stats(energy):
	update_energy(energy)

func update_energy(energy):
	energy_text.text = str(energy)
	energy_bar.value = energy

func _on_player_base_player_stat_change(energy):
	update_stats(energy)
