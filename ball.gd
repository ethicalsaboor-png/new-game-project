extends Area2D

var speed: float = 200.0
var velocity: Vector2 = Vector2.ZERO
var speedInRate = 1.001

func _ready() -> void:
	start_ball()

func _process(delta: float) -> void:
	position += velocity * delta
	velocity *= speedInRate
	var screen_size = get_viewport_rect().size
	if position.x < 0:
		get_parent().score_point("cpu")
		start_ball()
	elif position.x > screen_size.x:
		get_parent().score_point("player")
		start_ball()

func start_ball() -> void:
	speed = 200.0
	$"../player".scale.y = 1
	$"../cpu".scale.y = 1
	var screen_size = get_viewport_rect().size
	position = screen_size / 2
	var xx = randi_range(0, 1)
	if xx == 0:
		xx = -1
	velocity = Vector2(xx, randf_range(-0.75, 0.75)).normalized() * speed


func _on_area_entered(area: Area2D) -> void:
	if area.name == "boders":
		velocity.y *= -1
	elif area.name == "playerscore":
		get_parent().score_point("player")
		start_ball()
	elif area.name == "scoreleft":
		start_ball()
		get_parent().score_point("cpu")
	else:
		velocity.x *= -1
	print(area.name)
