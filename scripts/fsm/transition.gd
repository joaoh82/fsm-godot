@icon("res://icons/transition.png")
extends Node
class_name Transition

enum OperatorType {LESS_THAN, EQUAL, MORE_THAN}
enum ValueType {BOOLEAN, INT, FLOAT}

@onready var _parent_state = get_parent()

## Target State to transition in case condition is true
@export var target_state : State
@export_category("Condition")
@export_category("Variable name = EXACT MATCH")
@export var _variable_name : String
@export var _operator : OperatorType
@export var _value_type : ValueType
@export_category("If type is BOOLEAN, value has to be either 'true' or 'false'")
@export var _value : String


## Check if condition is true
func check_transition() -> bool:
	var parent_value = _parent_state.get(_variable_name)
	match _operator:
		OperatorType.LESS_THAN:
			match _value_type:
				ValueType.INT:
					if int(parent_value) < int(_value):
						return true
				ValueType.FLOAT:
					if float(parent_value) < float(_value):
						return true
		OperatorType.MORE_THAN:
			match _value_type:
				ValueType.INT:
					if int(parent_value) > int(_value):
						return true
				ValueType.FLOAT:
					if float(parent_value) > float(_value):
						return true
		OperatorType.EQUAL:
			match _value_type:
				ValueType.INT:
					if int(_value) == int(parent_value):
						return true
				ValueType.FLOAT:
					if float(_value) == float(parent_value):
						return true
				ValueType.BOOLEAN:
					if string_to_bool(_value) == parent_value:
						return true

	return false

## Convert string to boolean
func string_to_bool(s: String) -> bool:
	return s.to_lower() == "true"
