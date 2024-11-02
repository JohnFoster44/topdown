class_name NodeStateMachine
extends Node

@export var initial_node_state: NodeState

var node_states: Dictionary = {}
var current_node_state: NodeState
var current_node_state_name: String

# Called when the node is added to the scene.
# Initializes the state machine by collecting all child nodes that are of type NodeState.
# Connects the transition signal of each NodeState to the transition_to function.
# Sets the initial state and calls its _on_enter method.
func _ready() -> void:
	for child in get_children():
		if child is NodeState:
			node_states[child.name.to_lower()] = child
			child.transition.connect(transition_to)
	
	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state

# Called every frame. 
# Delegates the process call to the current state.
func _process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_process(delta)

# Called every physics frame.
# Delegates the physics process call to the current state.
func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta)
		current_node_state._on_next_transitions()
		print("Current State: ", current_node_state_name)


# Transitions the state machine to a new state specified by node_state_name.
func transition_to(node_state_name: String) -> void:
	# If the new state is the same as the current state, do nothing.
	if node_state_name == current_node_state.name.to_lower():
		return
	
	# Retrieve the new state from the node_states dictionary.
	var new_node_state = node_states.get(node_state_name.to_lower())
	
	# If the new state does not exist, do nothing.
	if !new_node_state:
		return
	
	# If there is a current state, call its _on_exit method.
	if current_node_state:
		current_node_state._on_exit()
	
	# Call the _on_enter method of the new state.
	new_node_state._on_enter()
	
	# Update the current state and its name.
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
	
	# Print the name of the new current state.
	print("Current State: ", current_node_state_name)
