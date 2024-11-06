### Overview

This script defines a state machine using the `NodeStateMachine` class. A state machine is a way to manage different states and transitions between them. Each state is represented by a `NodeState` class.

### Key Concepts

- **State**: A condition or situation during the life of an object, where it satisfies some condition, performs some activity, or waits for some event.
- **Transition**: The movement from one state to another.

### Code Explanation

#### Initialization (`_ready` function)

```gdscript
func _ready() -> void:
	for child in get_children():
		if child is NodeState:
			node_states[child.name.to_lower()] = child
			child.transition.connect(transition_to)

	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state
```

- **`_ready` function**: This function is called when the node is added to the scene.
- **`get_children()`**: This gets all the child nodes of the current node.
- **`if child is NodeState`**: Checks if the child node is of type `NodeState`.
- **`node_states[child.name.to_lower()] = child`**: Adds the child node to the `node_states` dictionary with its name as the key.
- **`child.transition.connect(transition_to)`**: Connects the `transition` signal of the child node to the `transition_to` function.
- **`if initial_node_state`**: Checks if an initial state is set.
- **`initial_node_state._on_enter()`**: Calls the `_on_enter` method of the initial state.
- **`current_node_state = initial_node_state`**: Sets the initial state as the current state.

#### Frame Update (`_process` function)

```gdscript
func _process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_process(delta)
```

- **`_process` function**: This function is called every frame.
- **`if current_node_state`**: Checks if there is a current state.
- **`current_node_state._on_process(delta)`**: Calls the `_on_process` method of the current state, passing the time since the last frame (`delta`).

#### Physics Update (`_physics_process` function)

```gdscript
func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta)
		current_node_state._on_next_transitions()
		print("Current State: ", current_node_state_name)
```

- **`_physics_process` function**: This function is called every physics frame.
- **`current_node_state._on_physics_process(delta)`**: Calls the `_on_physics_process` method of the current state.
- **`current_node_state._on_next_transitions()`**: Calls the `_on_next_transitions` method of the current state to check for any state transitions.
- **`print("Current State: ", current_node_state_name)`**: Prints the name of the current state.

#### State Transition (`transition_to` function)

```gdscript
func transition_to(node_state_name: String) -> void:
	if node_state_name == current_node_state.name.to_lower():
		return

	var new_node_state = node_states.get(node_state_name.to_lower())

	if !new_node_state:
		return

	if current_node_state:
		current_node_state._on_exit()

	new_node_state._on_enter()
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
```

- **`transition_to` function**: This function handles transitioning from one state to another.
- **`if node_state_name == current_node_state.name.to_lower()`**: Checks if the new state is the same as the current state. If so, it does nothing.
- **`var new_node_state = node_states.get(node_state_name.to_lower())`**: Retrieves the new state from the `node_states` dictionary.
- **`if !new_node_state`**: Checks if the new state exists. If not, it does nothing.
- **`if current_node_state`**: Checks if there is a current state.
- **`current_node_state._on_exit()`**: Calls the `_on_exit` method of the current state.
- **`new_node_state._on_enter()`**: Calls the `_on_enter` method of the new state.
- **`current_node_state = new_node_state`**: Updates the current state to the new state.
- **`current_node_state_name = current_node_state.name.to_lower()`**: Updates the name of the current state.

### Summary

- The `NodeStateMachine` class manages different states and transitions between them.
- It initializes by collecting all child nodes of type `NodeState`.
- It delegates process and physics process calls to the current state.
- It handles state transitions through the `transition_to` function.
