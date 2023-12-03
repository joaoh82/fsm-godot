extends State
class_name NewIdleState

@export var _actor : ColorRect

var _timer : float = 0.0

func enter_state() -> void:
	_actor.color = Color.BLUE_VIOLET
	_timer = 0.0
	

func update(_delta : float):
	super.update(_delta)
	
	_timer += _delta
