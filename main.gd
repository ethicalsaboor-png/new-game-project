extends Node

var player_score: int = 0
var cpu_score: int = 0

@onready var player_label: Label = $"hud/players score"
@onready var cpu_label: Label = $"hud/cpu score"

func score_point(side: String) -> void:
	if side == "player":
		player_score += 1
	else:
		cpu_score += 1
	update_score_labels()

func update_score_labels() -> void:
	player_label.text = str(player_score)
	cpu_label.text = str(cpu_score)
