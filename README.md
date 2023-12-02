# Node Based Finite State Machine for Godot

![Example of Finite State Machine](images/image.png)

## Requirements:

* Godot 4.0 +

## How to Setup?

1. Create the `scripts/fsm/` folder if you do not already have one (for organization purposes, in reality could be anywhere in your project).
2. Clone or download this project folder to your computer.
3. Copy the following files to the `scripts/fsm/` folder.
    * `scripts/fsm/finite_state_machine.gd`
    * `scripts/fsm/state.gd`
    * `scripts/fsm/transition.gd`
4. Create the `icons/` folder in the root of your project. If you want the icons customized in the scene tree.
5. Copy the following files into the `icons/` folder.
    * `icons/fsm.png`
    * `icons/state.png`
    * `icons/transition.png`
4. Setup is DONE!

## Important Definitions

If you go through the code you will find most of the well commented, but still, here are some important definitions.

**FiniteStateMachine** - Parent class of entire system. It controls what state is the initial and starting state, it is responsible for changing state and maintaining what the current state is. Implements the following methods:
* `func change_state(new_state: State):`
    * Change the current state of the State Machine

**State** - State is the base class where all the state should inherit from and implements the following methods:
* `func enter_state() -> void:`
    * Called when State Machine enters state. Usually used to do any setup.

* `func exit_state() -> void:`
    * Called when State Machine changes from this state to another state.

* `func update(_delta : float) -> void:`
    * Called on every frame. Equivalent to `_process(delta)`

* `func physics_update(_delta : float) -> void:`
    * Called on every physics frame. Equivament to `_physics_process(delta)`

**Transition** - Transition is responsible for validating if a specific condition is true and if so, transition to a specific target state. Implements the following methods:
* `func check_transition() -> bool:`
    * Check if condition is true and returns a bollean.

## How to use?

### This project works as a simple example of how to use it. But having a ColorRect code that changes states every 3 seconds controlled by the state machine.

Watch the tutorial on my Youtube channel: 

1. Add an child node of type FiniteStateMachine as a child of node you want to control with state machine. Example: Enemy. (It can be anything really)



### Contributing
**Pull requests are warmly welcome!!!**

For major changes, please [open an issue](https://github.com/joaoh82/fsm-godot/issues/new) first and let's talk about it. We are all ears!

If you'd like to contribute, please fork the repository and make changes as you'd like and shoot a Pull Request our way!

**Please make sure to update tests as appropriate.**

If you feel like you need it go check the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

### Code of Conduct

Contribution to the project is organized under the terms of the
Contributor Covenant, the maintainer of Screen Console, [@joaoh82](https://github.com/joaoh82), promises to
intervene to uphold that code of conduct.

### Contact

If you want to contact me you can reach me at <joaoh82@gmail.com>.
