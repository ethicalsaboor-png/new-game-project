extends Area2D

var speed: float = 300.0
var scaleDecrease = 0.01
func _process(delta: float) -> void:
	scale.y -= scaleDecrease * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	position.y = clamp(position.y, 56, 648-56)
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
