extends Node
class_name StateMachine

@export var default_state : State
@export var debug_messages : bool = false

var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			add_state(child)
			
	if default_state:
		default_state.Enter()
		current_state = default_state

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(new_state_name):
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
		
	if debug_messages:
		print("State Transition: " + str(current_state.name.to_lower()) + " -> " + str(new_state_name.to_lower()))
		
	if current_state:
		current_state.Exit()
	
	current_state = new_state
	
	new_state.Enter()

func add_state(state):
	states[state.name.to_lower()] = state
	state.Transition.connect(on_child_transition)

func get_state() -> String:
	return current_state.name.to_lower()
	
func check_if_state(id) -> bool:
	if get_state() == id.to_lower():
		return true
	return false

func pause() -> void:
	process_mode = PROCESS_MODE_DISABLED
	
func unpause() -> void:
	process_mode = PROCESS_MODE_INHERIT
