@icon("res://addons/fsm-godot/icons/state.png")
extends Node
class_name State

# PRIVATE VARIABLES

# The Finite State Machine that this State is a part of. The FSM is always a parent of the State
@onready var _fsm : FiniteStateMachine = get_parent() as FiniteStateMachine

## The interval at which the transitions are checked
@export var _check_transition_interval : float = 1

## The transitions that are a part of this state
var _transitions : Array[Transition]

## The timer that is used to check the transitions
var _check_transition_timer : float = 0.0


func _ready():
	for child in get_children():
		# All Children of a State should be a Transition
		if child is Transition:
			_transitions.append(child)
		

## Called when the node enters the scene tree for the first time.
func enter_state() -> void:
	pass


## Called when the node is about to be removed from the scene tree.
func exit_state() -> void:
	pass
	

## Called every frame
func update(_delta : float) -> void:
	_check_transition_timer += _delta
	if _check_transition_timer >= _check_transition_interval:
		_check_transition_timer = 0.0
		_check_transitions()
	

## Called every physics frame
func physics_update(_delta : float) -> void:
	pass


## Checks all the transitions and changes the state if the transition condition is true
func _check_transitions() -> void:
	for transition in _transitions:
		if transition.check_transition():
			# Transition condition is true, Change to Target state
			_fsm.change_state(transition.target_state)
