extends Area2D

var speed: float = 250.0
@onready var ball: Node2D = get_parent().get_node("ball")

var scaleDecrease = 0.01
func _process(delta: float) -> void:
	scale.y -= scaleDecrease * delta
	position.y = lerp(position.y, ball.position.y, 0.07)
	position.y = clamp(position.y, 56, 648-56)

	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
