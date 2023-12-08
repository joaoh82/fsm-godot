@tool
extends EditorPlugin
class_name NodeBasedFSM

func _enter_tree():
    add_custom_type("FiniteStateMachine", "Node", preload("res://addons/fsm-godot/scripts/finite_state_machine.gd"), preload("res://addons/fsm-godot/icons/fsm.png"))
    add_custom_type("State", "Node", preload("res://addons/fsm-godot/scripts/state.gd"), preload("res://addons/fsm-godot/icons/state.png"))
    add_custom_type("Transition", "Node", preload("res://addons/fsm-godot/scripts/transition.gd"), preload("res://addons/fsm-godot/icons/transition.png"))


func _exit_tree():
    remove_custom_type("FiniteStateMachine")
    remove_custom_type("State")
    remove_custom_type("Transition")
