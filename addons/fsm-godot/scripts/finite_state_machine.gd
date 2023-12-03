@icon("res://addons/fsm-godot/icons/fsm.png")
extends Node
class_name FiniteStateMachine

## Initial State that the State Machine will start with
@export var _initial_state : State

# PRIVATE VARIABLES
@export_category("Runtime filled...")
@export var _current_state : State


func _ready():
	if _initial_state:
		change_state(_initial_state)


func _process(delta):
	if _current_state:
		_current_state.update(delta)


func _physics_process(delta):
	if _current_state:
		_current_state.physics_update(delta)


## Change the current state of the State Machine
func change_state(new_state: State):
	if _current_state is State:
		# Exit the current state and enter the new one
		_current_state.exit_state()
	new_state.enter_state()
	# Set the new state as the current one
	_current_state = new_state
