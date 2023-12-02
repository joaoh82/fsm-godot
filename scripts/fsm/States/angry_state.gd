extends State
class_name angry_state

@export var _actor : ColorRect

var _timer : float = 0

func enter_state():
	_actor.color = Color.DARK_RED
	_timer = 0.0


func update(_delta : float):
	super.update(_delta)
	
	_timer += _delta
